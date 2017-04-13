class RemoveVotesFromPhrases < ActiveRecord::Migration[5.0]
  def change
    remove_column :phrases, :votes, :integer
  end
end
