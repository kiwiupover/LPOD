class Advert < ActiveRecord::Base
  attr_accessible :image, :link, :name
  
  validates_presence_of :image, :link, :name
  
  mount_uploader :image, AdvertUploader  
   
  scope :random, order('RANDOM()').first 
end
