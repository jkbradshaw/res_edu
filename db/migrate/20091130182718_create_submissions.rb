class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
