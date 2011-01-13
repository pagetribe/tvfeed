class Widget < ActiveRecord::Base
  has_many :videos
  after_create :set_name_and_embed_code
  
  require 'nokogiri'
  require 'open-uri'

  # Set up the embed code this is called after it is created to get the id
  def set_name_and_embed_code
    puts "this is the id #{ id }"
    update_attributes "code" => "<script type='text/javascript' language='JavaScript' src='http://localhost:3000/widgets/#{id}.js'></script>",
                      "name" => set_feed_details
  end
  
  # For each of the items in the xml get the title, and the url and save them with the corresponding widget id
  def set_feed_details
    # Open the url and add /displayRSSFeed to the end
    doc = Nokogiri::XML(open(url+ "/displayRSSFeed"))
    
    # For each of the items in the xml get the title, and the url of each video and save each video associated with the widget
    doc.css("item").each do |node|
      details = { "name" => node.css("media|title").text,
                  "url"  => node.css("media|group media|content")[0]['url']}
      videos.create(details) # save videos to db
    end
    
    # return main title and save as name
    doc.css("channel/title").text
  end
  
end
