class Book < ApplicationRecord
  with_options :presence true do
    validates :info
    validates :name
    validates :price
    validates :published_on
    validates :author_name
    validates :category
    validates :appearance
  end
end
