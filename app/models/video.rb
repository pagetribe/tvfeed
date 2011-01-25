class Video < ActiveRecord::Base
  belongs_to :widget
  require 'nokogiri'
  require 'open-uri'
  validates :name, :presence => true
  
  # For each of the items in the xml get the title, and the url and save them with the corresponding widget id
  def self.set_feed_details(url, widget_id)
    p url
    # Open the url and add /displayRSSFeed to the end
    doc = Nokogiri::XML(open(url+ "/displayRSSFeed"))
    
    puts "..........................................................................................................."
#    video << Hash['name', node.css("media|title").text, 'url', node.css("media|group media|content")[0]['url']]
    # For each of the items in the xml get the title, and the url
    doc.css("item").each do |node|
      details = { "name" => node.css("media|title").text,
                  "url"  => node.css("media|group media|content")[0]['url'],
                  "widget_id" => widget_id }
      p details
      create(details) # save to db
    end
  end

end
