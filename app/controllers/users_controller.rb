class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    user = User.find_by(user_hash: params[:user_hash])
    render :json => user.to_json
  end

  def index
  end

  # GET /users/1/edit
  def edit
    @party = Party.find_by(user_id: @user.id)
    @chars = Character.all

    @my_char_ids = [
      @party.character1_id,
      @party.character2_id,
      @party.character3_id,
      @party.character4_id,
    ]
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(name: user_params[:name])
      Party.find_by(user_id: @user.id).update(
        character1_id: user_params[:party][0],
        character2_id: user_params[:party][1],
        character3_id: user_params[:party][2],
        character4_id: user_params[:party][3],
      )
      redirect_to action: 'index', notice: 'ユーザー設定が完了しました!'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {
        name: "user-#{@user.id}",
        party: [],
      })
    end
end
