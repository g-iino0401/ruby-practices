#!/usr/bin/env ruby
# frozen_string_literal: true

def fetch_files
  Dir.glob('*')
end

ROWS = 3
def display_files(files)

  file_count = files.size
  max_length = files.map(&:length).max
  columns = (file_count + ROWS - 1) / ROWS
  (0...columns).each do |col|
    (0...ROWS).each do |row|
      index = col + row * columns
      if index < file_count
        adjusted_filename = files[index].ljust(max_length + 1)
        print adjusted_filename
      end
    end
    puts
  end
end

files = fetch_files
display_files(files)
