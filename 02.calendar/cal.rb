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
        print "#{date.day.to_s.rjust(2)} "
        puts if date.saturday?
    end
    puts
end

# オプション引数をハッシュに格納してnilでないか判定するため
options = { m: nil, y: nil}  

opt = OptionParser.new
opt.on('-m VALUE', '--month') {|v| options[:m] = v.to_i }
opt.on('-y VALUE', '--year') {|v| options[:y] = v.to_i }
opt.parse(ARGV)

# オプション指定されているか真偽値を確かめてメソッド引数を与えるため
m_has_value = !(options[:m]).nil?
y_has_value = !(options[:y]).nil?

cal_month = m_has_value ? options[:m] : today.month
cal_year = y_has_value ? options[:y] : today.year

create_cal(month: cal_month, year: cal_year)