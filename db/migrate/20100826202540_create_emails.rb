class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :email
      t.integer :count
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
