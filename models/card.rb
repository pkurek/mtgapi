module Models
  class Card
    def initialize(args = {})
      @args = args
    end

    def name
      @args['name']
    end

    def set
      @args['set']
    end

    def rarity
      @args['rarity']
    end

    def colors
      @args['colors']
    end

    def to_s
      "name: #{name}\n" +
      "set: #{set}\n" +
      "rarity: #{rarity}\n" +
      "colors: #{colors}\n" +
      "-------------------\n"
    end
  end
end
