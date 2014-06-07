class UserGroup < ActiveRecord::Base

  belongs_to :user
  belongs_to :group
  
  validates :user_id, :group_id, presence: true
  attr_accessible :user_id, :group_id
end
