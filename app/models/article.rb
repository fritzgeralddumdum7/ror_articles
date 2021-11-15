class Article < ApplicationRecord
  validates :title, :author, :content, presence: true
end
