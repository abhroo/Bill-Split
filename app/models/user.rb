class User < ActiveRecord::Base
  
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :expences
  has_many :expences_details
  
  attr_accessible :age, :gender, :name
  
  validates :name, :age, :gender, presence: true
  validates :age, numericality: { greater_than: 10 }
end
