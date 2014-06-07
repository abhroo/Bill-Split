module ExpencesHelper

def user_name_list(expence)  
  User.where(:id=>ExpencesDetail.where(:expence_id=>expence.id).pluck(:user_id)).pluck(:name).join(", ")
end

def user_amount(expence_id, user_id)
  ExpencesDetail.where(:expence_id=>expence_id, :user_id => user_id).first.amount
end

def user_list(expence_id)
  User.where(:id=>ExpencesDetail.where(:expence_id=>expence_id).pluck(:user_id))
end

def total_expence(group_id)
  sum = 0.0
  amount = Expence.where(:group_id=>group_id).pluck(:amount)
  return amount.inject(:+)
end

def user_spent(user_id)
  amount = ExpencesDetail.where(:user_id=> user_id).pluck(:amount)
  return amount.inject(:+)
end

def user_deference(user)
  amount = user_spent(user.id).to_f
  needs_to_pay = 0.0
  Expence.where(:group_id=>1).each do |e|
    needs_to_pay += (e.amount/e.expences_details.count) if e.expences_details.pluck(:user_id).include?(user.id)
  end
  return (amount - needs_to_pay)
end
  
end
