class RegionController < ApplicationController


  def create

    @region = Region.new(new_region_params)

    @region.save!

    redirect_to '/admin/regions', alert: 'Region created'
  end

  def destroy

    Region.find(params["region_id"]).destroy

      redirect_to '/admin/regions', alert: 'Region destroyed'

  end

private

def new_region_params
    params.require(:region).permit(:name )
end


end
