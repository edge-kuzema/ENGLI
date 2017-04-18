class RemoveActivityFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :activity, :integer
  end
end
