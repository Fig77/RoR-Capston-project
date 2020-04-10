class ArticleCategory < ApplicationRecord
  belongs_to :category
  belongs_to :article
  order_group = "SELECT * FROM 
                 (SELECT * FROM article_categories ORDER BY created_at DESC)
  				        GROUP BY category_id"      
  scope :new_all, -> {
  	self.connection.execute(order_group) 
  }
  def self.getArray
    arrayHash = new_all
    hashArray = []
    arrayHash.each { 
     |x| 
      hashArray.push(x['article_id'])
    }
    where(id: hashArray).includes({article: [:image_attachment, :author]}, :category)
  end

 

  scope :ordered_by_most_recent, -> { order(created_at: :desc).group_by(:category_id) }
end
