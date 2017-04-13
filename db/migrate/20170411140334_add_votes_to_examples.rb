class AddVotesToExamples < ActiveRecord::Migration[5.0]
  def change
    add_column :examples, :votes, :integer
  end
end
