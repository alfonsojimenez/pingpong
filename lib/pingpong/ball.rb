module Pingpong
  class Ball
    RADIANT = (Math::PI / 180).freeze
    DEFAULT_SPEED = 2.5.freeze

    def initialize(window, player1, player2, opts = {})
      @image = Gosu::Image.new(window, Pingpong.assets_dir('ball.png'), false)

      @direction = Direction.random
      @speed = DEFAULT_SPEED
      @angle = random_angle
      @diameter = 36

      @x = opts[:x] || 0.0
      @y = opts[:y] || 0.0

      @player1, @player2 = player1, player2
    end

    def draw
      @image.draw_rot(@x, @y, 1, @angle)
    end

    def lower_than?(player)
      @y > player.y + player.height/3
    end

    def higher_than?(player)
      @y < player.y - player.height/3
    end

    def move_to(x, y)
      @x, @y = x, y
    end

    def radius
      @diameter/2
    end

    def random_angle
      @angle = rand(45) * flip_direction
    end

    def increase_speed
      @speed += 0.25
    end

    def restart
      @x, @y = Game::HEIGHT/2, Game::WIDTH/2
      @speed = DEFAULT_SPEED
      random_angle
    end

    def invert_angle
      @angle *= -1
    end

    def flip_direction
      @direction = left? ? Direction::RIGHT : Direction::LEFT
    end

    def move
      check_collision

      @x = left? ? @x - @speed : @x + @speed
      @y += Math.tan(RADIANT * @angle) * @speed
    end

    def restart_and_score_up(player)
      restart && player.score_up
    end

    def left?
      @direction == Direction::LEFT
    end

    def right?
      @direction == Direction::RIGHT
    end

    def check_collision
      if left? && collide?(@player1, -radius) || right? && collide?(@player2, radius)
        increase_speed
        random_angle
      elsif @x >= Game::HEIGHT
        restart_and_score_up(@player1)
      elsif @x <= 0
        restart_and_score_up(@player2)
      elsif @y-radius <= 0 || @y+radius >= Game::WIDTH
        invert_angle
      end
    end

    private
    def collide?(player, offset=0)
      collide_horizontal?(player, offset) && collide_vertical?(player)
    end

    def collide_horizontal?(player, offset = 0)
      (player.x-player.width/2..player.x+player.width/2).include?(@x+offset)
    end

    def collide_vertical?(player)
      (player.y-player.height/2-radius..player.y+player.height/2+radius).include?(@y)
    end
  end
end

