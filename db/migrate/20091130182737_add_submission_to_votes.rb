class AddSubmissionToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :submission_id, :integer
  end

  def self.down
    remove_column :votes, :submission_id
  end
end
