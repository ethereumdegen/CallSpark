# Scaffolding generated by Casein v5.1.1.5

module Casein
  class InitiativeTargetsController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Initiative targets'
  		@initiative_targets = InitiativeTarget.order(sort_order(:bi_targetted_id)).paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View initiative target'
      @initiative_target = InitiativeTarget.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new initiative target'
    	@initiative_target = InitiativeTarget.new
    end

    def create
      @initiative_target = InitiativeTarget.new initiative_target_params
    
      if @initiative_target.save
        flash[:notice] = 'Initiative target created'
        redirect_to casein_initiative_targets_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new initiative target'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update initiative target'
      
      @initiative_target = InitiativeTarget.find params[:id]
    
      if @initiative_target.update_attributes initiative_target_params
        flash[:notice] = 'Initiative target has been updated'
        redirect_to casein_initiative_targets_path
      else
        flash.now[:warning] = 'There were problems when trying to update this initiative target'
        render :action => :show
      end
    end
 
    def destroy
      @initiative_target = InitiativeTarget.find params[:id]

      @initiative_target.destroy
      flash[:notice] = 'Initiative target has been deleted'
      redirect_to casein_initiative_targets_path
    end
  
    private
      
      def initiative_target_params
        params.require(:initiative_target).permit(:bi_targetted_id, :bi_targetted_type, :initiative_id)
      end

  end
end