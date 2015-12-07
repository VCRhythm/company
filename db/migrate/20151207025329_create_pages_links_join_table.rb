class CreatePagesLinksJoinTable < ActiveRecord::Migration
  def change
    create_join_table :pages, :links, table_name: :page_links do |t|
      t.index [:page_id, :link_id]
      # t.index [:link_id, :page_id]
    end
  end
end
