xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Landing Page of the Day"
    xml.description "Because Online Marketing is depends on Landing pages"
    xml.link landing_pages_url

    for lp in @landing_pages
      xml.item do
        xml.title lp.title
        xml.description "The landing Page #{lp.page_title} using the keyword #{lp.keyword} whichs costs #{lp.keyword_cpc} Per Click" 
        xml.pubDate lp.release_date.to_s(:rfc822)
        xml.link landing_page_url(lp)
        xml.guid landing_page_url(lp)
      end
    end
  end
end