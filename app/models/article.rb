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
#  subcategory_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Article < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  belongs_to :subcategory

  validates :name, precense: true, length: { minimum: 3}
  validates :sku, precense: true, length: { minimum: 3}
  validates :description, precense: true, length: { minimum: 3}
end
