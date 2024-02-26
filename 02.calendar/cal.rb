#!/usr/bin/env ruby

# カレンダーのプログラム
require 'date'
require 'optparse'

def calender(year, month)
  # ヘッダー表示
  puts "#{month}月 #{year}年".center(20)
  puts "日 月 火 水 木 金 土"

  # 最初の日
  start_date = Date.new(year, month, 1)

  # 最後の日
  end_date = Date.new(year, month, -1)

  # 月の1日が始まる位置までスペースを表示
  print "   " * start_date.wday

  # 日を1日から月末まで順に表示
  (start_date..end_date).each do |date|
    print date.day.to_s.rjust(2) + " "
    # 土曜日の場合は改行
    puts if date.saturday?
  end
  puts "\n"
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: cal.rb [options]"

  opts.on("-y", "--year YEAR", Integer, "Specify year") do |year|
    options[:year] = year
  end

  opts.on("-m", "--month MONTH", Integer, "Specify month") do |month|
    options[:month] = month
  end
end.parse!

year = options[:year] || Date.today.year
month = options[:month] || Date.today.month

calender(year, month)
