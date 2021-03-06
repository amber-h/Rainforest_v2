class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents, :category, :poster_name 

  validates :description, :category, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}

  validates :unique_like_per_user
  
  has_and_belongs_to_many :users, :join_table => 'votes'  # this is actually the like mechanism

  def formatted_price
  	price_in_dollars = price_in_cents.to_f / 100
  	sprintf("%.2f", price_in_dollars)
  end

   has_many :reviews 
   # has_many :users, :through => :reviews

   def unique_like_per_user
   		
   end

  
   
end
