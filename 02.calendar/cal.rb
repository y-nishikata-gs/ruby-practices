require 'optparse'
require 'date'

today = Date.today

def create_cal(month:, year:)
    start_date = Date.new(year, month, 1)
    end_date = Date.new(year, month, -1)

    puts "      #{month}月 #{year}"
    puts "日 月 火 水 木 金 土"

    print " " * (start_date.wday * 3)
    (start_date..end_date).each do |date|
        if date.saturday?
            puts "#{date.day.to_s.rjust(2)} " # 日はスペースと数字を合わせてsizeが2となるため
        else
            print "#{date.day.to_s.rjust(2)} "
        end
    end
    print " \n"
end

options_bool = {}
options_value = {}

# オプションが指定されているか判定するために取得
opt_bool = OptionParser.new
opt_bool.on('-m', '--month') {|v| options_bool[:m] = v }
opt_bool.on('-y', '--year') {|v| options_bool[:y] = v }
opt_bool.parse(ARGV)

# オプション指定の真偽値
m_has_value = (options_bool[:m])
y_has_value = (options_bool[:y])

# オプション引数
opt_val = OptionParser.new
opt_val.on('-m VALUE', '--month') {|v| options_value[:m] = v.to_i }
opt_val.on('-y VALUE', '--year') {|v| options_value[:y] = v.to_i }
opt_val.parse(ARGV)

cal_month = m_has_value ? options_value[:m] : today.month
cal_year = y_has_value ? options_value[:y] : today.year

create_cal(month: cal_month, year: cal_year)
