class Widget < ActiveRecord::Base
  has_many :videos
  after_create :set_embed_code
  
  # Set up the embed code
  def set_embed_code
    puts "this is the id #{ id }"
    update_attributes "code" =>  "<script type='text/javascript' language='JavaScript' src='http://localhost:3000/widgets/#{id}.js'></script>"
  end
end
