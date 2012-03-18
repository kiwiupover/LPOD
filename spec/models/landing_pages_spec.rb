require 'spec_helper' 

describe "Filling in landing page details" do
  it "should return the title to for the given url" do
    require 'Nokogiri'
    doc = Nokogiri::HTML(open("http://google.com"))
    page_title = doc.title
    page_title.should eql("Google")
  end 
  
  it "should return the PPC Budget should return something" do
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    agent.get("http://www.alexa.com/")
    form = agent.page.forms.first
    form.q = "google.com"
    form.submit
    agent.page.link_with(:text => "Get Details").click
    agent.page.link_with(:text => "Search Analytics").click 
    alexa_rating = agent.page.search("#top-keywords-from-search .searchLink").map(&:text).map(&:strip)
    puts alexa_rating
    alexa_rating.should_not eql("")
    keywords = []
    agent.page.search("#top-keywords-from-search .searchLink").each do |keyword|
      keywords << keyword.text.strip
    end 
    puts keywords
    keywords.should_not eql("")
  end
end