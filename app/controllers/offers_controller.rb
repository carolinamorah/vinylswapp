class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]
  before_action :set_user_vinyls, only: %i[ new create ]
  before_action :set_vinyl
  before_action :authenticate_user!

  # GET /offers or /offers.json
  def index  
    @vinyl = Vinyl.find(params[:vinyl_id])
    @offers = @vinyl.offers.includes(:user).all.order("created_at desc")
  end

  # GET /offers/1 or /offers/1.json
  def show
    #@user = @offer.user_id == current_user ? @offer.owner_id : @offer.user_id
  end

  # GET /offers/new
  def new
    @vinyl = Vinyl.find(params[:vinyl_id])
    @offer = Offer.new
    @offer.owner_id = @vinyl.user_id
    @offered_vinyl = current_user.vinyls.pluck(:title, :id)
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers or /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    @offer.owner_id = params[:offer][:owner_id].to_i
    @offer.offer_state = "pending"
    @offer.vinyl_id = params[:vinyl_id].to_i
    @offered_vinyl = current_user.vinyls.pluck(:title, :id)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to my_offers_path(current_user.id), notice: "Offer was successfully sended to the vinyl owner." }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1 or /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to vinyl_offer_path(@offer.vinyl_id, @offer.id), notice: "Offer was successfully updated." }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to my_offers_path(@offer.user_id, @offers), notice: "Offer was successfully canceled." }
      format.json { head :no_content }
    end
  end

  def user_offers
    @received_offers = Offer.where(owner_id: current_user.id).where.not(offer_state: ["declined", "accepted"])
    @offers_sent= current_user.offers.where.not(offer_state: "accepted")
    @user_id = current_user.id
    @swaps_other = Offer.where(owner_id: @user_id, offer_state: "accepted")
    @swaps_user = Offer.where(user_id: @user_id, offer_state: "accepted") 
    
   
     
    #@offers = Offer.find_by(params[:id])
    #@user = User.find(@offers.owner_id)

    #@user_owner = @offers.owner_id
    #@user_sender = @offers.user_id
    #@profile_owner = Profile.find_by(user_id: @user)  
    #@profile_sender = Profile.find_by(user_id: @user_sender) 
  end 

  def accept
    @user = current_user
    
    offer = Offer.find(params[:id])
    offered_vinyl = Vinyl.find(offer.offeredvinyl_id)
    other_vinyl = Vinyl.find(offer.vinyl_id)
    if offer && offer.update(offer_state: "accepted")
      
      offered_vinyl.update(user_id: current_user.id)
      other_vinyl.update(user_id: offer.user_id)
      offered_vinyl.update(status: "swapped")
      other_vinyl.update(status: "swapped")

      Offer.where(vinyl_id: offer.vinyl_id).where.not(id: offer.id).update_all(offer_state: "declined")
      Offer.where(offeredvinyl_id: offer.vinyl_id).where.not(id: offer.id).update_all(offer_state: "declined")
      Offer.where(vinyl_id: offer.offeredvinyl_id).where.not(id: offer.id).update_all(offer_state: "declined")
      Offer.where(offeredvinyl_id: offer.offeredvinyl_id).where.not(id: offer.id).update_all(offer_state: "declined")
      
      flash[:notice] = "Congratulations! You have done a vinyl swap"
      #OfferNotifierMailer.send_completed_swap_email(current_user).deliver_now
      redirect_to my_offers_path(current_user.id, @offers)  

     
    else 
      flash[:error] = "No se pudo concretar el swap"
      redirect_to vinyls_path
    end
  end

  def decline
      offer = Offer.find(params[:id])
      if offer 
          if offer.update(offer_state: "declined")

            flash[:alert] = "You have refused a vinyl swap request"  
              redirect_to root_path
          end
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find_by(id: params[:id]) #coloqué id:
    end

    def set_vinyl
      @vinyl = Vinyl.find_by_id(params[:vinyl_id])
    end

    def set_user_vinyls
      @user_vinyls = current_user.vinyls
    end

  

    # Only allow a list of trusted parameters through.
    def offer_params
      params.require(:offer).permit(:offeredvinyl_id, :vinyl_id, :offer_state, :user_id, :owner_id, :end_date)
    end
end
