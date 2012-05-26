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
end
