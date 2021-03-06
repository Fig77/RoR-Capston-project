class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  def self.features(id)
    article = []
    Category.find(id).articles.ordered_by_priority.each do |x|
      article.push(x)
    end
    article
  end

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 70 }
end
