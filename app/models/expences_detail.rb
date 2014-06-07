class ExpencesDetail < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :expence
  
  attr_accessible :user_id, :amount, :expence_id
  
end
