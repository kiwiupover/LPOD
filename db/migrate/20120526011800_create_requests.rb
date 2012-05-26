class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.string :url
      t.string :keyword

      t.timestamps
    end
  end
end
