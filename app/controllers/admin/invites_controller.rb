class Admin::InvitesController < AdminController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  def index
    @invites = Invite.all
  end

  def show
  end

  def new
    @invite = Invite.new
  end

  def edit
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.school_id = @school.id

    respond_to do |format|
      if @invite.save
        Admin::InviteMailer.new_user_invite(@invite, register_url).deliver
        # , new_admin_user_path(invite_token: @invite.token)
        format.html { redirect_to admin_invites_path, notice: 'Invite was successfully created.' }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end





  end

  def invite
    @invite = Invite.new
  end

  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to admin_invites_path, notice: 'Invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to admin_invites_path, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_invite
      @invite = Invite.find(params[:id])
    end

    def invite_params
      params.require(:invite).permit(:email, :school_id, :token)
    end
end
