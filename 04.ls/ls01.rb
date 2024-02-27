#!/usr/bin/env ruby
# frozen_string_literal: true

# 現在のディレクトリに存在する全てのファイルを取得する
def fetch_files
  Dir.glob('*').sort
end

# 取得したファイルの一覧を出力する
def display_files(files)
  # ファイルの数を取得
  file_count = files.size
  # p file_count
  # 行を3行に指定
  rows = 3
  # 必要な列数を取得
  columns = (file_count + rows - 1) / rows
  # ファイルを表示
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
