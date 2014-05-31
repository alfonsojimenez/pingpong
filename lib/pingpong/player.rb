module Pingpong
  class Player
    attr_accessor :x, :y, :score, :width, :height

    def initialize(window, opts = {})
      @image = Gosu::Image.new(window, Pingpong.assets_dir('bar.png'), false)

      @height = 100
      @width = 10
      @velocity_y = 0.0
      @score = 0
      @x = opts[:x] || 0.0
      @y = opts[:y] || 0.0
    end

    def move_to(x, y)
      @x, @y = x, y
    end

    def move_up
      @velocity_y += Gosu::offset_y(0, 0.5)
    end

    def move_down
      @velocity_y += Gosu::offset_y(180, 0.5)
    end

    def move
      @y += @velocity_y
      @y %= Game::WIDTH

      @velocity_y *= 0.96
    end

    def score_up
      @score += 1
    end

    def draw
      @image.draw_rot(@x, @y, 1, 0)
    end
  end
end

