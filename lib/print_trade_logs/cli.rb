require "print_trade_logs"
require "thor"
require "csv"
require "yaml"

module PrintTradeLogs
  class CLI < Thor
    default_command :print
    
    desc "-f FILE", "Trade logs as JSON prints."
    option :file, type: :string, aliases: "-f", desc: "Input file name"
    def print
      table = CSV.table(options[:file], encoding: "Windows-31J:UTF-8")
      table_sorted_by_num = table.group_by{|row| row[2]}
      stat = table_sorted_by_num.map do |code, row|
        profit_loss = row.map {|r|
          if r[11].to_s.include?(",")
            r[11].delete(",").to_i
          else
            r[11].to_i
          end
        }.inject(:+)
        {"code" => code,
         "name" => row[0][3],
         "profit_loss" => profit_loss,
         "appraise" => nil,
         "comment" => nil}
      end
      puts({"trade" => stat}.to_yaml)
    end
  end
end
