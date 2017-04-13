class AddColumnToExamples < ActiveRecord::Migration
  def change
     
    add_column :examples, :cached_votes_up, :integer, :default => 0
    add_column :examples, :cached_votes_down, :integer, :default => 0
    add_column :examples, :cached_votes_score, :integer, :default => 0
    add_index  :examples, :cached_votes_up
    add_index  :examples, :cached_votes_down
    add_index  :examples, :cached_votes_score
  end
end
