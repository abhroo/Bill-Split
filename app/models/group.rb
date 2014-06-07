class Group < ActiveRecord::Base

  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :expences
 
  attr_accessible :name, :description
  
  validates :name, presence: true
  validates :description, length: {
    maximum: 250,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_long: "must have at most %{count} words"
  }
end
