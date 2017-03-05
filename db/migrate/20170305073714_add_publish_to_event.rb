class AddPublishToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :publish, :integer
  end
end
