class RankingController < ApplicationController
    def show
        @score_rank = Ranking.where(music_name: music_name).order(score: desc).limt(10)
        @damage_rank = Ranking.where(music_name: music_name).order(damage: desc).limt(10)
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
            character_id1: ,
            character_id2: ,
            character_id3: ,
            character_id4: ,
        })
    end


     
end
