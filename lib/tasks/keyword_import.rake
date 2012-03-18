# desc "Keyword Import"
# task  :keyword_import => environment do
#   require 'mechanize'
#   agent = Menchanize.new
#   agent.get("http://www.alexa.com/")
#   form = agent.page.forms.first
#   form.q = "quickenloans.com"
#   form.submit
#   agent.page.link_with(:text => "Get Details").click
#   agent.page.link_with(:text => "Search Analytics").click
#   agent.page.search("#top-keywords-from-search .searchLink").each do |keyword| 
#    
# end 