require 'net/http'
require 'noko'

class BggApiService
  BASE_URL = "https://boardgamegeek.com/xmlapi2"

  def self.fetch_collection(username)
    url = URI("#{BASE_URL}/collection?username=#{username}&own=1")
    response = Net::HTTP.get(url)
    Nokogiri::XML(response)
  end

  def fetch_plays(username)
    url = URI("#{BASE_URL}/plays?username=#{username}")
    response = Net::HTTP.get(url)
    Nokogiri::XML(response)
  end

  def parse_collection(xml)
    games = []
    xml.xpath('//item').each do |item|
      games << {
        bgg_id: item['objectid'].to_i,
        name: item.at_xpath('name').content,
        year: item.at_xpath('yearpublished')&.content.to_i,
        image: item.at_xpath('image')&.content
      }
    end
    games
  end

  def parse_plays(xml)
    plays = []
    xml.xpath('//play').each do |play|
      game_name = play.at_xpath('item')['name']
      game = Game.find_by(name: game_name) || Game.create(name: game_name)

      plays << {
        game_id: game.id,
        date: play['date'],
        quantity: play['quantity'].to_i
      }
    end
    plays
  end
end