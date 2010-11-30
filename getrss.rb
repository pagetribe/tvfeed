require 'rubygems'
require 'nokogiri'
require 'open-uri'

#doc = Nokogiri::XML(open("http://tv.unsw.edu.au/40848B12-2BD9-11DF-AA9D123139020041/displayRSSFeed/displayRSSFeed"))
doc = Nokogiri::XML(open("http://tv.unsw.edu.au/40848B12-2BD9-11DF-AA9D123139020041/displayRSSFeed"))

doc.css("item").each do |node|
#  puts node.css("media|content")[1]['fileSize']
  puts node.css("media|title").text
  p node.css("enclosure")[0]['length'] # get length from enclosure
  puts node.css("media|group media|content")[0]['url'] # get first url from media:content as it has autostart=true
  p "......................"
end


#puts doc.css('media|title')
#puts doc.css('media|content').length
#puts doc.at_xpath('//item/pubDate')
#doc.xpath('//media:content').each do |node|
#	p node
#end
#doc.css("item title").each do |node|
#  p node.text
#end
#doc.css("item media|content").each do |node|
#  p node[0]
#end
#p doc.xpath("//media:content")[0]
#p "........."
#p doc.xpath("//media:content")[3].attributes['url'].value

# this findes each of the media content items and prints out their url value
#doc.xpath("//media:content").each do |node|
##  puts 'string found' unless node.attributes['url'].value.index('-portalStd') == nil
#  p node.attributes['url'].value
#end
#doc.xpath("//media:content").each do |node|
# p node
#end
#p doc.xpath("//media:content")[0].attributes['url'].value

#doc.css("item media|group").each do |node|
#  p node.children[1].attributes['url']
#end

#doc


# this grabs the first of the elements with autostart=true


