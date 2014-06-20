class Admin::InvitesController < AdminController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  def index
    @invites = school.invites
    redirect_to admin_path if @invites.size < 1
  end

  def new
    @invites = school.invites
    @invite = Invite.new
  end

  def edit
  end

  def show
  end

  def create

    @invite = Invite.new(invite_params)
    @invite.school_id = @school.id

    respond_to do |format|
      if @invite.save
        Admin::InviteMailer.new_user_invite(@invite, register_url).deliver
        # , new_admin_user_path(invite_token: @invite.token)
        format.html { redirect_to admin_path, notice: "Invite sent to #{@invite.email}!" }
      else
        format.html {   
          windex(@invite)
         render 'admin/index' }
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
