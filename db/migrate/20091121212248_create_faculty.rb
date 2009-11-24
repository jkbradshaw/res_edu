class CreateFaculty < ActiveRecord::Migration
  def self.up
    create_table :faculty do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :faculty
  end
end
