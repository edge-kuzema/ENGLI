class RemoveColumsFromPhrases < ActiveRecord::Migration[5.0]
  def change
    remove_column :phrases, :cached_votes_up, :integer, :default => 0
    remove_column :phrases, :cached_votes_down, :integer, :default => 0
    remove_column :phrases, :cached_votes_score, :integer, :default => 0
  end
end
