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
#  user_id     :integer
#

class Prop < ApplicationRecord
  belongs_to :category, {:optional => true}
  belongs_to :user

  validates :name, presence: true
  validates :phone, presence: true
end
