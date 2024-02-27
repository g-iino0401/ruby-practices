#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
current_score = score.split(',')
shots = []
current_score.each do |score|
  if score == 'X'
    shots << 10 # 1投目
    shots << 0 # 2投目
  else
    shots << score.to_i
  end
end

frames = []
shots.each_slice(2) do |shot|
  frames << shot
end

point = 0
frames.each_with_index do |frame, index|
  if index >= 9
    point += frame.sum
    next 
  end

  point += if frame[0] == 10 # strike
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
    # p "#{index + 1}フレーム目:#{frame}"
end
puts point
