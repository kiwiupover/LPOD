# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://landingpageoftheday.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  # add landing_pages_path, :priority => 1, :changefreq => 'daily' 
  #
  # Add all articles:
  #
  LandingPage.find_each do |lp|
    add landing_page_path(lp), :lastmod => lp.release_date
  end
end
