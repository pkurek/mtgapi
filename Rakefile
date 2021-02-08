require_relative 'mtgapi'

namespace :cards do
  @api = MtgApi.new

  task :all do
    puts @api.cards
  end

  task :grouped_by_set do
    puts @api.cards_grouped_by_set
  end

  task :grouped_by_set_rarity do
    puts @api.cards_grouped_by_set_rarity
  end
end
