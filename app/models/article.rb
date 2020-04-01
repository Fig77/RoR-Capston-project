class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :votes

  validates :text, presence: true, length: { minimum: 70 }
  #validates :title, presence: true, length: { minimum: 5 }&&{maximum: 70 }
end
