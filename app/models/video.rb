class Video < ActiveRecord::Base
  belongs_to :widget
  
  def self.set_feed_details(url)
    pp url
    doc = Nokogiri::XML(open(url+ "/displayRSSFeed"))
    
    puts "..........................................................................................................."
    doc.css("item").each do |node|
      details = { "name" => node.css("media|title").text,
                  "url"  => node.css("media|group media|content")[0]['url'] }
             
      p details
      
      new(details)
      
      #  puts node.css("media|content")[1]['fileSize']
#      puts node.css("media|title").text
#      p node.css("enclosure")[0]['length'] # get length from enclosure
#      puts node.css("media|group media|content")[0]['url'] # get first url from media:content as it has autostart=true
#      p "......................"
    end
    
  end
end
