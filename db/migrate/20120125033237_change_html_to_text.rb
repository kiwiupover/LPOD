class ChangeHtmlToText < ActiveRecord::Migration
  def up
    # change_column :landing_pages, :html, :blob
  end

  def down
    # change_column :landing_pages, :html, :binary
  end
end
