class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.float :progress
      t.text :status

      t.belongs_to :user
      t.timestamps null: false
    end
    add_index :jobs, :user_id
  end
end
