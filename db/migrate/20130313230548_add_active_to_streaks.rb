class AddActiveToStreaks < ActiveRecord::Migration
  def change
    add_column :streaks, :is_active, :boolean, default: true
  end
end
