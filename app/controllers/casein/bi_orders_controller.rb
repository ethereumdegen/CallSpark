# Scaffolding generated by Casein v5.1.1.5

module Casein
  class BiOrdersController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Bi orders'
  		@bi_orders = BiOrder.order(sort_order(:order_number)).paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View bi order'
      @bi_order = BiOrder.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new bi order'
    	@bi_order = BiOrder.new
    end

    def create
      @bi_order = BiOrder.new bi_order_params
    
      if @bi_order.save
        flash[:notice] = 'Bi order created'
        redirect_to casein_bi_orders_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new bi order'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update bi order'
      
      @bi_order = BiOrder.find params[:id]
    
      if @bi_order.update_attributes bi_order_params
        flash[:notice] = 'Bi order has been updated'
        redirect_to casein_bi_orders_path
      else
        flash.now[:warning] = 'There were problems when trying to update this bi order'
        render :action => :show
      end
    end
 
    def destroy
      @bi_order = BiOrder.find params[:id]

      @bi_order.destroy
      flash[:notice] = 'Bi order has been deleted'
      redirect_to casein_bi_orders_path
    end
  
    private
      
      def bi_order_params
        params.require(:bi_order).permit(:order_number, :order_suffix, :line_number, :ship_prod, :prod_desc, :warehouse, :bi_customer_no, :customer_po, :ship_to_name, :ship_to_address1, :ship_to_city, :ship_to_state, :prod_cost_cents, :price_cents, :sales_cents, :bi_inside_sales_rep_id, :bi_outside_sales_rep_id, :prod_category, :bi_vendor_no, :qty_ord, :enter_date, :promise_date, :request_date)
      end

  end
end