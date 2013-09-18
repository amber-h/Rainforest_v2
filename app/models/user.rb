class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name, :photo_url
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :name

  has_and_belongs_to_many :products, :join_table => 'votes'

  has_many :reviews
  # has_many :products, :through => :reviews 

  

end