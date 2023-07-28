require 'optparse'
require 'date'

today = Date.today

# 日付を条件に応じて1日ずつ出力
def create_cal(month:, year:)
    start_date = Date.new(year, month, 1)
    end_date = Date.new(year, month, -1)

    puts "      #{month}月 #{year}"
    puts "日 月 火 水 木 金 土"

    (start_date..end_date).each do |date|
        if date.saturday?
            if date.day < 10 # 1桁の日付は左にスペース
                if date == start_date
                    puts date.day.to_s.rjust(date.wday * 3 + 2) # 初日は曜日に合わせてレイアウトを調整
                else
                    puts " " + date.day.to_s + " "
                end
            else
                puts date.day.to_s + " "
            end
        else
            if date.day < 10 # 1桁の日付は左にスペース
                if date == start_date
                    print date.day.to_s.rjust(date.wday * 3 + 2) + " " # 初日は曜日に合わせてレイアウトを調整
                else
                    print " " + date.day.to_s + " "
                end
            else
                print date == end_date ? date.day.to_s + " \n" : date.day.to_s + " "
            end
        end
    end
end

options_bool = {}
options_value = {}

# オプションが指定されているか
opt_bool = OptionParser.new
opt_bool.on('-m', '--month') {|v| options_bool[:m] = v }
opt_bool.on('-y', '--year') {|v| options_bool[:y] = v }
opt_bool.parse(ARGV)

# オプション指定の真偽値
m_has_value = (options_bool[:m] == true)
y_has_value = (options_bool[:y] == true)

# オプション引数
opt_val = OptionParser.new
opt_val.on('-m VALUE', '--month') {|v| options_value[:m] = v.to_i }
opt_val.on('-y VALUE', '--year') {|v| options_value[:y] = v.to_i }
opt_val.parse(ARGV)


# オプションに応じてカレンダーを表示
if m_has_value && y_has_value
# 年月を指定
    create_cal(month: options_value[:m], year: options_value[:y])
elsif m_has_value
# 月を指定
    create_cal(month: options_value[:m], year: today.year)
else
# 指定なし
    create_cal(month: today.month, year: today.year)
end
