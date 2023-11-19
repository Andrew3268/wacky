class HubController < ApplicationController

  def airfryers_recommend
    @airfryers = Airfryer.all.order("created_at DESC")
  end

end


