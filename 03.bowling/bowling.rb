#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10 # 1投目
    shots << 0 # 2投目
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.each_with_index do |frame, index|
  point += if index < 9 # 1~9フレーム目の処理
             if frame[0] == 10 # strike
               if frames[index + 1][0] == 10 # 次のフレームもストライク
                 20 + frames[index + 2][0]
               else
                 10 + frames[index + 1].sum
               end
             elsif frame.sum == 10 # spare
               10 + frames[index + 1][0]
             else
               frame.sum
             end
           else # 10フレーム目の処理
             frame.sum
           end
  # p "#{index + 1}フレーム目:#{frame}"
end
puts point
