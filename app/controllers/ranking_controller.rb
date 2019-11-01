class RankingController < ApplicationController
    def show
        music_name = params[:music_name]
        @score_rank = Ranking.where(music_name: music_name).order("score DESC").limit(10)
        @damage_rank = Ranking.where(music_name: music_name).order("damage DESC").limit(10)
    end

    def create
        rank = Rainking.new(ranking_params)
        rank.save
    end

private
    def ranking_params
        params.fetch(:ranking, {
            user_id: nil,
            music_name: 0,
            damage: 0,
            characters: nil,
        })
    end


     
end
