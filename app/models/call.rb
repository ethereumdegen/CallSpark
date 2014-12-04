class Call < ActiveRecord::Base
 attr_accessible :customer_id,:category_id,:text,:user_id
 
 def getCustomerName
   
   customer = Customer.where(id: customer_id).first
   
   if(customer != nil)
       return customer.name
    else
      return "N/A"
   end
   
  
 end
 
 
  def getCategoryName
   
   category = Category.where(id: category_id).first
   
   if(category != nil)
       return category.name
    else
      return "N/A"
   end
   
  
 end

end