# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Brand < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1}

  has_one_attached :image do |attachable|
    attachable.variant :full, resize_to_limit: [1000, 1000]
    attachable.variant :card, resize_to_limit: [400, 400]
    attachable.variant :thumb, resize_to_limit: [150, 150]
  end

  has_one_attached :image_cover do |attachable|
    attachable.variant :full, resize_to_limit: [1000, 1000]
    attachable.variant :card, resize_to_limit: [500, 500]
    attachable.variant :thumb, resize_to_limit: [150, 150]
  end
end
