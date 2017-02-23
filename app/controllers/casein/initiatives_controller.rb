# Scaffolding generated by Casein v5.1.1.5

module Casein
  class InitiativesController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Initiatives'
  		@initiatives = Initiative.order(sort_order(:name)).paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View initiative'
      @initiative = Initiative.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new initiative'
    	@initiative = Initiative.new
    end

    def create
      @initiative = Initiative.new initiative_params
    
      if @initiative.save
        flash[:notice] = 'Initiative created'
        redirect_to casein_initiatives_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new initiative'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update initiative'
      
      @initiative = Initiative.find params[:id]
    
      if @initiative.update_attributes initiative_params
        flash[:notice] = 'Initiative has been updated'
        redirect_to casein_initiatives_path
      else
        flash.now[:warning] = 'There were problems when trying to update this initiative'
        render :action => :show
      end
    end
 
    def destroy
      @initiative = Initiative.find params[:id]

      @initiative.destroy
      flash[:notice] = 'Initiative has been deleted'
      redirect_to casein_initiatives_path
    end
  
    private
      
      def initiative_params
        params.require(:initiative).permit(:name)
      end

  end
end