class RemoveCountFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :count
  end
end
