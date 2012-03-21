class AddRelatedTextKeywordsToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :related_text_keywords, :text
  end
end
