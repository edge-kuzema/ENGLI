class CreatePhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :phrases do |t|
      t.text :phrase
      t.text :translation
      t.text :examples
      t.integer :votes
      t.string :category
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :phrases, :created_at
  end
end
