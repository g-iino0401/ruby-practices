#!/usr/bin/env ruby
# frozen_string_literal: true
ROWS = 3

def fetch_files
  Dir.glob('*')
end

def display_files(files)
  file_count = files.size
  max_length = files.map(&:length).max
  columns = (file_count + ROWS - 1) / ROWS
  (0...columns).each do |col|
    (0...ROWS).each do |row|
      index = col + row * columns
      next if index >= file_count
      print files[index].ljust(max_length + 1)
    end
    puts
  end
end

files = fetch_files
display_files(files)
