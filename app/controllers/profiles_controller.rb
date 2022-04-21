class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update destroy upvote downvote]

  def index
    @profiles = Profile.all
  end

  def show
    @vinyls = Vinyl.all.order("created_at DESC").where(user_id: @profile.user.id).page(params[:page])
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def upvote
    if @profile.user_id != current_user.id
      @profile.upvote_from current_user
      redirect_to profile_path
    end
  end

  def downvote
    if @profile.user_id != current_user.id
      @profile.downvote_from current_user
      redirect_to profile_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:avatar, :bio, :latitude, :longitude, :state, :city, :user_id)
    end

end
