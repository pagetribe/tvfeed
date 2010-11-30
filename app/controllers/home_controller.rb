require 'rubygems'
require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
  def index
  end
  
  def display_rss # Called from index.html.erb on submit
    Video.set_feed_details(params[:url])
    
#    doc = Nokogiri::XML(open(params[:url]+ "/displayRSSFeed"))
#    
#    puts "..........................................................................................................."
#    doc.css("item").each do |node|
#      #  puts node.css("media|content")[1]['fileSize']
#      puts node.css("media|title").text
#      p node.css("enclosure")[0]['length'] # get length from enclosure
#      puts node.css("media|group media|content")[0]['url'] # get first url from media:content as it has autostart=true
#      p "......................"
#    end
    
#    puts doc.xpath('//*[(((count(preceding-sibling::*)//a')
#    @rss = doc
    

  end
end
