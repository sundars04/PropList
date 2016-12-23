# == Schema Information
#
# Table name: props
#
#  id          :integer          not null, primary key
#  name        :string
#  address     :text
#  url         :string
#  bhk         :string
#  area        :string
#  sqft        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  phone       :integer
#  price       :decimal(12, 3)
#  category_id :integer
#

require 'test_helper'

class PropTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
