module Pingpong
  class Mode
    SINGLE = 'Single'.freeze
    TWO_PLAYERS = 'Two players'.freeze
    
    class << self
      def all
        [SINGLE, TWO_PLAYERS]
      end
    end
  end
end

