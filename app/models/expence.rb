class Expence < ActiveRecord::Base
  
  belongs_to :group
  belongs_to :user
  has_many :expences_details
  
  serialize :user_ids
  
  validates :amount, :description, :group_id, :location, presence: true
  
  attr_accessible :amount, :description, :group_id, :location, :user_ids
end
