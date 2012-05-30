class AddCommentaryToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :commentary, :text
  end
end
