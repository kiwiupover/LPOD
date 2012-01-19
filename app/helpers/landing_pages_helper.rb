module LandingPagesHelper
  def oddeven(index)
    if( index%2 == 0)
      "even"
    else
      "odd"
    end
  end
  
  def page_one?
    if (params[:page].nil? || params[:page] <= "1") 
      true 
    end
  end
  
  def format_date(date, format = :rfc822 )
    content_tag :div, :class => 'date' do
      date.to_date().to_formatted_s(format)
    end unless date.nil?
  end
  
  def keyword(keyword)
    content_tag :li, :class => "details" do
      @output = content_tag :span, "Keyword: "
      @output << keyword
    end unless keyword.nil?
  end
  
  def cost_per_click(keyword_cpc)
    content_tag :li, :class => "details" do
      @output = content_tag :span, "Cost Per Click: "
      @output << keyword_cpc
    end unless keyword_cpc.nil?
  end
  
  def like_button(landing_page)
    content_tag :li do
      link_to landing_page.score, {:controller => "landing_pages", :action => "vote", :id => landing_page}, :class => "vote add", :remote => true
    end
  end
  
  def sidebar_lp(page, klass)
    if page
      content_tag :li, :class => klass do
        concat image_tag(page.screen_shot.smallthumb.url.to_s, :class => "border")
        concat link_to image_tag("arrow-#{klass}.png", :class => "hide arrow"), page
      end
    else
      content_tag :li do
        image_tag 'group-end.png', :class => "border end-lp"
      end
    end
    
  end
  
  def lp_thumbs(category, prev_lp, next_lp)
    if prev_lp || next_lp
     @output = content_tag(:h4, "<span>More:</span> #{category.name} Pages".html_safe , :class => "more")
     @output << tag(:ul, :class => "block-grid two-up")
     @output << sidebar_lp(prev_lp, klass="left")
     @output << sidebar_lp(next_lp, klass="right")
     @output << "</ul>".html_safe
    end
  end
 
end
