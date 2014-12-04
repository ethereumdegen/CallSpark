class CallsController < ApplicationController
  
  def new
     
  end
  
  def update
    customername = params['id'];
    
    customer = Customer.where( :name => customername).first
    
    render json: customer
  end
  
    def history
    customername = params['id'];
    
    customer = Customer.where( :name => customername).first
    
    render json: Call.where(customer_id: customer.id).reverse
  end
  
  def create
    #render text: params[:call].inspect
    
    @customer = Customer.where(name: params[:call][:caller]).first
    
    if @customer == nil
      @customer = Customer.new(:name => params[:call][:caller],
     :company => params[:call][:company] ,
      :phone_number => params[:call][:phone],
      :email => params[:call][:email]
      )
      
    else
      
    @customer.company =  params[:call][:company];
     @customer.phone_number =  params[:call][:phone];
     @customer.email =  params[:call][:email];
      
    end
    
    @customer.save
    
    
  
    @call = Call.new(:customer_id => @customer.id,
     :text => params[:call][:text],
     :user_id => current_user.id
    
      )
 
  @call.save
  redirect_to @call
  
  end
  
  def destroy
      Call.find(params["id"]).destroy
  

      redirect_to '/calls', alert: 'Call destroyed'
    
  end
  
private
  def call_params
    params.require(:call).permit(:customer_id, :text)
  end
   def customer_params
    params.require(:customer).permit(:name, :company,:phone_number,:email)
  end
  
          
  
end