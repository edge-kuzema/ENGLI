class AddIndexToPhrases < ActiveRecord::Migration[5.0]
  def change
    add_column :phrases, :category_name, :string
  end
end
