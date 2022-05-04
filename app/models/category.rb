class Category < ApplicationRecord
    has_many :vinyls, through: :category_vinyls
    has_many :category_vinyls

    scope :all_categories, -> {where.not(id: nil)}
end
