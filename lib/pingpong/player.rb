module Pingpong
  class Player
    attr_accessor :x, :y, :score, :width, :height, :speed

    def initialize(window, opts = {})
      @image = Gosu::Image.new(window, Pingpong.assets_dir('bar.png'), false)

      @height = 100
      @width = 10
      @score = 0
      @x = opts[:x] || 0.0
      @y = opts[:y] || 0.0
      @speed = opts[:speed] || Level::NORMAL
    end

    def move_to(x, y)
      @x, @y = x, y
    end

    def move_up
      @y -= 0.9 * @speed if @y > height/2
    end

    def move_down
      @y += 0.9 * @speed if @y < 430
    end

    def score_up
      @score += 1
    end

    def draw
      @image.draw_rot(@x, @y, 1, 0)
    end
  end
end

