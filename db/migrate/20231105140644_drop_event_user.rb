class DropEventUser < ActiveRecord::Migration[7.1]
  def change
    drop_table :event_users
  end
end
