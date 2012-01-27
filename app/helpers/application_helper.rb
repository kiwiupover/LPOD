module ApplicationHelper  
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Landing Page of the Day").join(" | ")
      end
    end
  end
end
