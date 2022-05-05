class CategoryVinyls < ApplicationRecord
    belongs_to :category
    belongs_to :vinyl
end