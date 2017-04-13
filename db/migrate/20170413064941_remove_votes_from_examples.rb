class RemoveVotesFromExamples < ActiveRecord::Migration[5.0]
  def change
    remove_column :examples, :votes, :integer
  end
end
