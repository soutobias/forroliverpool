class CreateCommunities < ActiveRecord::Migration[7.1]
  def change
    create_table :communities do |t|
      t.text :profile_image, array: true, default: []
      t.string :name, array: true, default: []
      t.text :profile
      t.text :description
      t.timestamps
    end
  end
end
