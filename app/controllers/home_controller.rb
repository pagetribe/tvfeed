require 'rubygems'
require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
  def index
  end
  
  def display_rss
    doc = Nokogiri::XML(open(params[:url]+ "/displayRSSFeed"))
    puts "..........................................................................................................."
    puts doc.xpath('//*[(((count(preceding-sibling::*)//a')
    @rss = doc
    

  end
end
