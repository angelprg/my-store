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
require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
