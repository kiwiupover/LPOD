module AdvertsHelper  
  
  def link(name, link)
    link_to name, "#{link}?ref=kiwiupover", :class => "advert-link"
  end
end
