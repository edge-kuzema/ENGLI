class AddActivityToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activity, :integer
  end
end
