#!/usr/bin/env ruby
# frozen_string_literal: true

def fetch_files
  Dir.glob('*')
end

ROWS = 3
def display_files(files)

  file_count = files.size
  rows = ROWS

  columns = (file_count + rows - 1) / rows
  (0...columns).each do |col|
    (0...rows).each do |row|
      index = col + row * columns
      print files[index].ljust(15) if index < file_count
    end
    puts
  end
end

files = fetch_files
display_files(files)
