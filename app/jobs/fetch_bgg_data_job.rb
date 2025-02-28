class FetchBggDataJob < ApplicationJob
 queue_as :default

 def perform(username)
  collection_xml = BggApiService.fetch_collection(username)
  collection_data = BggApiService.parse_collection(collection_xml)

  collection_data.each do |game_data|
    Game.find_or_create_by(bgg_id: game_data[:bgg_id], user: user) do |game|
      game.name = game_data[:name]
      game.year = game_data[:year]
      game.image = game_data[:image]
    end
  end

  plays_xml = BggApiService.fetch_plays(user.bgg_username)
  plays_data = BggApiService.parse_plays(plays_xml)

  plays_data.each do |play_data|
    game = user.games.find_by(name: play_data[:game_name])
    next unless game
    Play.create(game: game, date: play_data[:date], quantity: play_data[:quantity])
  end
 end
end