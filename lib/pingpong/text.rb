module Pingpong
  class Text
    def initialize(window)
      @window = window
    end

    def font
      @font ||= Gosu::Font.new(@window, Pingpong.assets_dir('bm_germar.ttf'), 20)
    end

    def text(message, x, y, size = 1.0, color = Gosu::Color::BLACK)
      font.draw(message, x, y, 4, size, size, color)
    end

    def help
      text('up: S down: A', 10, 450, 1.0, Gosu::Color::CYAN)
      text('up: K down: J', 520, 450, 1.0, Gosu::Color::CYAN)
    end

    def pause
      text('PAUSE', half_height-74, half_width-30, 3.0)
    end

    def start
      text('PRESS SPACE TO START', half_height-175, half_width+60, 2.0)
      text('PING PONG', half_height-155, half_width-120, 4.0, Gosu::Color::RED)
    end

    def scores(player1, player2)
      text("Score: #{player1.score}", 10, 10, 1.0, Gosu::Color::YELLOW)
      text("Score: #{player2.score}", 540, 10, 1.0, Gosu::Color::YELLOW)
    end

    def half_height
      @window.half_height 
    end

    def half_width
      @window.half_width 
    end
  end
end

