# Scaffolding generated by Casein v5.1.1.5

module Casein
  class BiInsideSalesRepsController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Bi inside sales reps'
  		@bi_inside_sales_reps = BiInsideSalesRep.order(sort_order(:id)).paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View bi inside sales rep'
      @bi_inside_sales_rep = BiInsideSalesRep.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new bi inside sales rep'
    	@bi_inside_sales_rep = BiInsideSalesRep.new
    end

    def create
      @bi_inside_sales_rep = BiInsideSalesRep.new bi_inside_sales_rep_params
    
      if @bi_inside_sales_rep.save
        flash[:notice] = 'Bi inside sales rep created'
        redirect_to casein_bi_inside_sales_reps_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new bi inside sales rep'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update bi inside sales rep'
      
      @bi_inside_sales_rep = BiInsideSalesRep.find params[:id]
    
      if @bi_inside_sales_rep.update_attributes bi_inside_sales_rep_params
        flash[:notice] = 'Bi inside sales rep has been updated'
        redirect_to casein_bi_inside_sales_reps_path
      else
        flash.now[:warning] = 'There were problems when trying to update this bi inside sales rep'
        render :action => :show
      end
    end
 
    def destroy
      @bi_inside_sales_rep = BiInsideSalesRep.find params[:id]

      @bi_inside_sales_rep.destroy
      flash[:notice] = 'Bi inside sales rep has been deleted'
      redirect_to casein_bi_inside_sales_reps_path
    end
  
    private
      
      def bi_inside_sales_rep_params
        params.require(:bi_inside_sales_rep).permit(:id, :code, :name)
      end

  end
end