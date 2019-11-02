とりあえずランキングへのPOSTは可能にしました
ファイル詳細
- ranking_controller.rb
-- app/controllers/にあるranking_controller.rbと置き換えてください
- tool
-- DBにUserを初期設定するためのtool群です
-- fanta_testのすぐ下においてください(appやconfigと同じところ)

Userの初期設定
1. fanta_testに移動してください
2. rails r tool/create_user.rb を実行してください
しばらく待てばuserが初期設定されています


POST
/ranking にPOSTしてください

JSON
{
"music_name": "hoge",
 "score": 1000,
 "damage": 1500,
 "user_hash": "6d71a9d5e505e787af75e51a2d3ed2606b563772de0056fe54519686dc483327"
}

の形式でPOSTしてください