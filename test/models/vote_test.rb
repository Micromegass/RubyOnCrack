# == Schema Information
#
# Table name: votes
#
#  id            :bigint(8)        not null, primary key
#  voteable_id   :integer
#  voteable_type :string
#  user_id       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
