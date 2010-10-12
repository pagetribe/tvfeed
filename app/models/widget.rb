class Widget < ActiveRecord::Base
  has_many :videos, :dependent => :destroy
end
