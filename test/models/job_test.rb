# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  progress    :float
#  status      :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
