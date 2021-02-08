require 'json'
require 'httparty'
require 'pry'

# App files
require_relative 'models/card.rb'

class MtgApi
  BASE_URL = "https://api.magicthegathering.io/v1"

  # this might take a while :)
  def cards
    @cards ||= []
    page   = 1

    return @cards unless @cards.empty?

    while true
      puts "fetching page #{page}"

      json = JSON.parse(get('/cards', query: { page: page}).body)
      page += 1

      json['cards'].each { |card| @cards << Models::Card.new(card) }

      break if json.empty? || page > 5
    end

    @cards
  end

  def cards_grouped_by_set
    cards.group_by(&:set)
  end

  def cards_grouped_by_set_rarity
    c = cards_grouped_by_set

    c.each do |k, v|
      c[k] = v.group_by(&:rarity)
    end
  end

  private

  def get(endpoint, opts = {})
    HTTParty.get(url(endpoint), opts)
  end

  def url(endpoint)
    BASE_URL + endpoint
  end
end


