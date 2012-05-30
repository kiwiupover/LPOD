module ApplicationHelper  
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Landing Page of the Day").join(" | ")
      end
    end
  end
  
  def meta_description(meta_description)
   if meta_description
     content_for :meta_description => meta_description
   else
     content_for :meta_description => "Some text"
   end  
  end 
  
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(
        :hard_wrap => true, :filter_html => true, :safe_links_only => true),
        :no_intraemphasis => true, :autolink => true)
    return markdown.render(text).html_safe
  end
end
