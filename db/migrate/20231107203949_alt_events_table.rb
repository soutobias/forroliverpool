class AltEventsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :type_event, :string
  end
end
