#!/usr/bin/env ruby

require 'ttfunk'

font = TTFunk::Collection.open('/System/Library/Fonts/Apple Color Emoji.ttc') do |ttc|
  ttc.find { |ttf| ttf.name.font_name.first == 'Apple Color Emoji' }
end

code_map = font.cmap.tables.select {|t| t.unicode?}.reduce({}) do |code_map, table|
  code_map.merge(table.code_map)
end

filename = 'CodePointSet.swift'
contents = "\
//
//  #{filename}
//  NSString+RemoveEmoji
//
//  Created by woxtu on 2018/01/11.
//  Copyright (c) 2018 woxtu. All rights reserved.
//

import Foundation

let CodePointSet = Set<UInt32>([
#{ code_map.keys.select{|key| 0x39 < key}.map {|key| '    0x%05X,' % key }.join("\n") }
])
"

File.open("./Sources/#{filename}", 'w') do |file|
  file.puts contents
end
