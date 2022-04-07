class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]
  before_action :set_user_vinyls, only: %i[ new create ]
  before_action :set_vinyl

  # GET /offers or /offers.json
  def index
    @vinyl = Vinyl.find(params[:vinyl_id])
    @offers = @vinyl.offers.includes(:user).all
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
        format.html { redirect_to vinyl_offer_path(params[:vinyl_id], @offer), notice: "Offer was successfully sended to the vinyl owner." }
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
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully updated." }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to vinyl_offers_path(params[:vinyl_id], @offer.id), notice: "Offer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def user_offers
    @received_offers = Offer.where(owner_id: current_user.id)
    @offers = current_user.offers
  end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
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
