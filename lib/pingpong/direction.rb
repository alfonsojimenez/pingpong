module Pingpong
  class Direction
    RIGHT = 1.freeze
    LEFT = -1.freeze

    class << self
      def random
        [RIGHT, LEFT].sample
      end
    end
  end
end

