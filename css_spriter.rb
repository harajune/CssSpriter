# encoding=utf-8
#

require "rubygems"
require "nokogiri"
require "libs/CssSpriter.rb"
require "pp"
require "open-uri"

if ARGV.size != 1 then
    puts "require html file path"
    exit
end

css_spriter = CssSpriter.new(open(ARGV[0]))
css_spriter.make_sprite("dest")

