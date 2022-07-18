# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  image       :string
#  cover_image :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Brand < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1}
end
