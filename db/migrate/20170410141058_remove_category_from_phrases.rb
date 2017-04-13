class RemoveCategoryFromPhrases < ActiveRecord::Migration[5.0]
  def change
    remove_column :phrases, :category, :string
  end
end
