class ChangePublishInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :publish, :string
  end
end
