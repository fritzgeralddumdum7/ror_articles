class Article < ApplicationRecord
  validates :title, :author, :content, presence: true

  def full_name
    "#{title} - #{author}"
  end
end
