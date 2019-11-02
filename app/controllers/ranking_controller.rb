class RankingController < ApplicationController
    protect_from_forgery
    def show
        music_name = params[:music_name]
        @score_rank = Ranking.where(music_name: music_name).order("score DESC").limit(10)
        @damage_rank = Ranking.where(music_name: music_name).order("damage DESC").limit(10)
    end

    def create
        user = User.find_by(user_hash: params[:user_hash])
        rank = Ranking.new(ranking_params)
        rank.user_id = user.id
        rank.save!
    end

private
    def ranking_params
      params[:ranking].permit(:music_name, :damage, :score)
    end
end
