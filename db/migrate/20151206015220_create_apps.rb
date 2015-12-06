class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.text :description
      t.string :link
      t.belongs_to :user

      t.timestamps null: false
    end
    add_index :apps, :user_id
  end
end
