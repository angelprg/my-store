class Article < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  belongs_to :subcategory
end
