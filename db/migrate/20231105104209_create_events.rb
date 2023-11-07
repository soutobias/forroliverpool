class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.float :price
      t.text :cover_image
      t.text :image, array: true, default: []
      t.datetime :registration_start_datetime
      t.datetime :registration_end_datetime
      t.string :sell_site_number
      t.timestamps
    end
  end
end
