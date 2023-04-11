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
    if current_user.admin?
      @total_users = User.count
      @daily_requests = Offer.group_by_month_of_year(:created_at, format: "%b").where(offer_state: [0, 1, 2]).count
      @daily_completed_swaps = Offer.where(offer_state: 1).group_by_month_of_year(:created_at, format: "%b").count  
      render :admin_dashboard
    elsif current_user 
      @profile = Profile.find_by(params[current_user.id])  
      @daily_requests = Offer.where(owner_id: current_user.id).group_by_day_of_week(:created_at, format: "%a").count
      @daily_completed_swaps = Offer.where(offer_state: 1, user_id: current_user.id).group_by_day_of_week(:created_at, format: "%a").count
    end
  end
  
end  