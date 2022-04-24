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




    # def dashboard
    #     if current_user.admin?
    #       @vinyls_count = Vinyl.all.count
    #       @completed_swaps_count = Offer.where(state: 1).count
    #      ### charts
    #       @monthly_completed_swaps = Offer.where(state: 1).group_by_month(:created_at).count
    #       @vinyls_by_owner = Vinyl.joins(:user).group("users.collectionist_name").count
    #       a = Vinyl.joins(:offers).where(offers: {state: 1}).group(:title).count
    #       @best_vinyls = (a.sort_by(&:last).reverse.first(10).to_h)
    #     end
    #     @users_count = User.all.count
    # end
end