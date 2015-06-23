class AddRewardColumnToReports < ActiveRecord::Migration
  def change
    add_column :reports, :reward, :string
  end
end
