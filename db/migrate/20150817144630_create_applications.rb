class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :url
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :applications, :users
  end
end
