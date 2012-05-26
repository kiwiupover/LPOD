xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Landing Page of the Day"
    xml.description "Because Online Marketing is depends on Landing Pages"
    xml.link landing_pages_url

    for lp in @landing_pages
      xml.item do
        xml.title lp.title
        xml.description "The landing page #{lp.page_title} uses the keyword #{lp.keyword} which costs #{lp.keyword_cpc} per click" 
        xml.pubDate lp.release_date.to_s(:rfc822)
        xml.link landing_page_url(lp)
        xml.guid landing_page_url(lp)
      end
    end
  end
end