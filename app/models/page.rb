class Page < ActiveRecord::Base
    has_and_belongs_to_many :links, join_table: :page_links
end
