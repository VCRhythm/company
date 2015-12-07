class CreateUsersAppsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :apps, table_name: :app_access do |t|
      t.index [:user_id, :app_id]
      # t.index [:app_id, :user_id]
    end
  end
end
