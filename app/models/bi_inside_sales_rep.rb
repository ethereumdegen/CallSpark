class BiInsideSalesRep < ActiveRecord::Base
  validates :code, presence: true, uniqueness:true

end
