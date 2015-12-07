# == Schema Information
#
# Table name: apps
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  link        :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class App < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: :app_access
end
