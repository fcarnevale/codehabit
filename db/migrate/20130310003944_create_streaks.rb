class CreateStreaks < ActiveRecord::Migration
  def change
    create_table :streaks do |t|
      t.integer :user_id
      t.integer :num_days

      t.timestamps
    end
  end
end
