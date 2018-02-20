#!/usr/bin/ruby
# -*- coding: utf-8 -*-
# coding: utf-8
#
# 情報処理学会情報学広場でダウンロードしたPDFのファイル名をわかりやす
# く変更するプログラム
#
# Copyright (C) 2018 Kota Abe
#
# Web site: <http://github.com/ktabe/ipsj-rename-papers/>

#
# Usage: ruby ipsj-rename-papers.rb <import.xmlを含むディレクトリ名>
#

require 'nkf'
require 'rexml/document'

if ARGV.size != 1 then
  warn("specify the path that contains \"import.xml\"")
  exit 1
end

dir = ARGV[0]
if !File.directory?(dir) then
  warn("#{dir} is not directory")
  exit 1
end

importFile = "#{dir}/import.xml"

if !File.exists?(importFile) then
  warn("#{dir} does not contain \"import.xml\"")
  exit 1
end

import = File.read(importFile)
doc = REXML::Document.new(import)

exp = doc.elements['export']
title = ""
exp.each_element do |elem|
  case elem.name
  when "repository_item" then
    title = elem.attribute("title").value()
  when "repository_file" then
    filename = elem.attribute("file_name").value()
    # puts "#{title} -- #{filename}"
    if (File.extname(filename) == ".pdf") then
      # replace invalid chars with fullwidth ones
      title.tr!('\/:*?"<>|', "＼／：＊？”＜＞｜")
      base = File.basename(filename, ".pdf")
      base.gsub!(/^IPSJ-/, '')
      newname = "#{base}-#{title}.pdf"
      puts "rename #{filename} -> #{newname}"
      if (File.exists?(filename)) then
        begin
          File.rename(filename, newname)
          begin
            Dir.delete(File.dirname(filename))
          rescue => error
            warn("rmdir failed: #{error}")
          end
        rescue => error
          warn("rename failed: #{error}")
        end
      else
        puts "#{base} does not exist"
      end
    end
  end
end

# EOF
