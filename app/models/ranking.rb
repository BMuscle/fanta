class Ranking < ApplicationRecord
  has_one :character1, class_name: 'Character'
  has_one :character2, class_name: 'Character'
  has_one :character3, class_name: 'Character'
  has_one :character4, class_name: 'Character'
  has_many :character_rankings
  has_many :characters, through: :character_rankings, source: :character

  # 保存前に uniq_user_adn_chars? メソッドを実行する
  #validate :uniq_user_and_chars?

  private
  # 保存前に実行されるメソッド
  # 同じUserとCharacter(同じPT構成)で保存ができないようにする
  def uniq_user_and_chars?
    # Rankingからuserとそれぞれのcharacterを検索
    rank = Ranking.find_by(user_id: self.user_id,
                           character1_id: self.character1_id,
                           character2_id: self.character2_id,
                           character3_id: self.character3_id,
                           character4_id: self.character4_id,
                           )
    return if rank.nil?  # 検索結果が無い(nil)の場合はメソッドを抜けて保存
    # スコアが高いかダメージが少ないとメソッドを抜けて保存
    return if self.score > rank.score || self.damage < rank.damage
    # それ以外はerrorとして保存しない
    errors.add(:user_id, "ユーザが重複しています")
  end
end
