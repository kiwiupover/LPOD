class LandingPage < ActiveRecord::Base
  belongs_to  :landing_page_type
  belongs_to  :industry
  has_many    :votes 
  
  format_url :url
  
  has_event_calendar :start_at_field  => 'release_date', :end_at_field => 'release_date'    
  validates_presence_of :title, :url, :release_date, :keyword, :industry_name, :landing_page_type_name
  validates_uniqueness_of :url, :release_date
  
  mount_uploader :screen_shot, ScreenshotUploader
  
  after_create :landing_page_thumbnails, :calendar_dates, :add_html 

  #added a tiny bit of error checking, so we can leave this active and see how it goes
  # after_update :get_cpc 

  #to use in home page, don't get stuff that shouldnt be released yet
  scope :not_future, where("release_date < ?", Time.zone.now.to_date + 1.day)

  scope :default, order("release_date desc")
  
  scope :calendar, where("release_date > ?", Time.now - 30.days).default
   
  scope :prev, lambda { |current| where('release_date < ?', current).order("release_date DESC")}
  
  scope :next, lambda { |current| where('release_date > ?', current).order("release_date ASC")} 
  
  extend FriendlyId

  friendly_id :title, use: :slugged
  
  def should_generate_new_friendly_id?
    new_record?
  end
  
  def self.industry_id(industry_id)
    where(:industry_id => industry_id)
  end 
  
  def self.landing_page_type_id(landing_page_type)
    where(:landing_page_type_id => landing_page_type)
  end
  
  def self.prev_next(current_page)
    where('id < ?', current_page).limit(1)
  end 
 
  def update_score
    vote_counts = Vote.where('landing_page_id = ?', self.id).count
    self.score = vote_counts
    self.save
  end   
  
  def industry_name
    industry.try(:name)
  end
  
  def industry_name=(name)
    name = name.titleize
    self.industry = Industry.find_or_create_by_name(name) if name.present?
  end
  
  def landing_page_type_name
    landing_page_type.try(:name)
  end
  
  def landing_page_type_name=(name)
    self.landing_page_type = LandingPageType.find_or_create_by_name(name) if name.present?
  end
  
  def landing_page_thumbnails
    kit = IMGKit.new("#{self.url}") 
    path = "#{Rails.root}/public/#{self.title.downcase.gsub(" ","_")}.jpg"  
    file = kit.to_file(path)  
    self.screen_shot = File.open(path) 
    self.score = 0
    self.save!   
  end 
  handle_asynchronously :landing_page_thumbnails
  
  def add_html
    doc = Nokogiri::HTML(open("#{self.url}"))
    self.html = doc.to_html
    self.save!
  end
  handle_asynchronously :add_html
  
  def calendar_dates
    date = self.release_date
  end
 
  
  # Need to setup Tests  
  # def get_cpc
  #   keyword2 = self.keyword.gsub(" ","+")
  #   url = "http://www.keywordspy.com/research/search.aspx?q=#{keyword2}&type=keywords"
  #   #url = "http://www.semrush.com/search.php?q=#{keyword}&db=us"
  #   doc = Nokogiri::HTML(open(url)) 
  #   if doc.none?
  #     cpc = doc.at_css(".alter:nth-child(2) td:nth-child(2)").text if doc.at_css(".alter:nth-child(2) td:nth-child(2)")
  #     #cpc = doc.at_css("#container_url_01").text
  #     #self.update_attribute(:keyword_cpc, cpc)
  #     self.keyword_cpc = cpc
  #     self.save
  #   end  
  # end 
  
end
