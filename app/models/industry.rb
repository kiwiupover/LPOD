class Industry < ActiveRecord::Base
  has_many :landing_pages
 
  scope :default, order("name asc")
  
  extend FriendlyId
  friendly_id :name, use: :slugged
   
  def should_generate_new_friendly_id?
    new_record?
  end
end
