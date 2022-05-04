class HomeController < ApplicationController
    before_action :authenticate_user!, except: %i[ index ]

  # GET /orders or /orders.json
  def index
    if user_signed_in?
      redirect_to vinyls_path
    end 
  end
  

  def offers_list 
      @offers_list = Offer.all.where(offer_state: ["accepted", "declined", "pending"]).order("created_at asc") 
  end


  def dashboard
    if current_user 
      @profile = Profile.find_by(params[current_user.id])  
    
      @daily_requests = Offer.group_by_day(:created_at).where(offer_state: [0, 1, 2], owner_id: current_user.id).count
      @daily_completed_swaps = Offer.where(offer_state: 1, owner_id: current_user.id).group_by_day(:created_at).count
    end
  end
  
end  