# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  name           :string
#  sku            :string
#  barcode        :string
#  slug           :string
#  description    :text
#  published      :boolean          default(FALSE)
#  visible        :boolean          default(FALSE)
#  price          :integer
#  stock          :integer
#  brand_id       :integer          not null
#  category_id    :integer          not null
#  subcategory_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Article < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3}
  validates :sku, presence: true, length: { minimum: 3}
  validates :description, presence: true, length: { minimum: 3}

  belongs_to :brand
  belongs_to :category
  belongs_to :subcategory

  has_one_attached :image_cover do |attachable|
    attachable.variant :full, resize_to_limit: [1000, 1000]
    attachable.variant :card, resize_to_limit: [400, 400]
    attachable.variant :thumb, resize_to_limit: [150, 150]
  end

  has_many_attached :images do |attachable|
    attachable.variant :full, resize_to_limit: [1000, 1000]
    attachable.variant :card, resize_to_limit: [400, 400]
    attachable.variant :thumb, resize_to_limit: [150, 150]
  end
end
