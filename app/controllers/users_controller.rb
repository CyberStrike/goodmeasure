class UsersController < ApplicationController
  before_action :check_for_token, only: [:new]
  skip_before_action :redirect_to_login

  # GET /users/new
  def new
    @user = User.new
  end

  def show
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to 'login', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private


    def check_for_token
      @invite = Invite.find_by(token: params[:token]) rescue nil
      redirect_to root_url unless @invite
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password_digest, :first_name, :last_name, :email, :school_id)
    end
end
