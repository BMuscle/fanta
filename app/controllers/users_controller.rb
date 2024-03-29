class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :purchase]

  def index
  end

  def show
    # Userを見つける
    user = User.find_by(user_hash: params[:user_hash])
    # PT用のハッシュを準備
    hash1 = {
      nickname: user.name, # ユーザーのニックネームを設定
      role: []
    }
    
    # Userに紐づくPartyを取得
    party = Party.find_by(user_id: user.id)

    if party != nil
      # character1～4をpush
      hash1[:role].push(Character.find(party.character1_id))
      hash1[:role].push(Character.find(party.character2_id))
      hash1[:role].push(Character.find(party.character3_id))
      hash1[:role].push(Character.find(party.character4_id))
    end

    render :json => hash1.to_json
  end

  # GET /users/1/edit
  def edit
    @user_hash = params[:user_hash]
    @party = Party.find_by(user_id: @user.id)
    @chars = getAvailableChars(@user)
    @all_chars = Character.all

    if @party == nil
      @my_char_ids = []
    else
      @my_char_ids = [
        @party.character1_id,
        @party.character2_id,
        @party.character3_id,
        @party.character4_id,
      ]
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find_by(user_hash: user_params[:user_hash])
    if @user == nil
      render :edit
      return
    end
    name = user_params[:name]
    permission = user_params[:permission]
    @user.name = name if name
    @user.permisson = permission if permission
    @user.save

    if user_params[:party]
      party = Party.find_by(user_id: @user.id)
      if party == nil
        party = Party.new
        party.user_id = @user.id
        party.save
      end

      party.update(
        character1_id: user_params[:party][0],
        character2_id: user_params[:party][1],
        character3_id: user_params[:party][2],
        character4_id: user_params[:party][3],
      )
    end

  redirect_to action: 'index', notice: 'ユーザー設定が完了しました!'
  end

  def purchase

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(user_hash: params[:user_hash])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      p = params[:user][:party] || []
      {
        name: params[:user][:name],
        user_hash: params[:user][:user_hash],
        party: [
          p[0] || nil,
          p[1] || nil,
          p[2] || nil,
          p[3] || nil,
        ],
        permission: params[:user][:cart].join(",")
      }
=begin
      params.fetch(:user, {
        user_hash: params[:user][:user_hash],
        party: []
      })
=end
      #params.fetch(:user, {user_hash: params[:user][:user_hash]})
=begin
      params.fetch(:user, {
        name: "user-#{@user.id}",
        party: [],
      })
=end
    end
    def getAvailableChars(user)
      p = user.permisson&.split(",")
      if !p
        return []
      end
      Character.all.select{|v| p.include? v.id.to_s}
    end
end
