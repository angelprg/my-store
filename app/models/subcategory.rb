# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  image       :string
#  cover_image :string
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Subcategory < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: { minimum: 3}
end
