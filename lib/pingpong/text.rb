module Pingpong
  class Text
    def initialize(window)
      @window = window
    end

    def font
      @font ||= Gosu::Font.new(@window, Pingpong.assets_dir('bm_germar.ttf'), 20)
    end

    def text(message, x, y, size = 1.0, color = color::BLACK)
      font.draw(message, x, y, 4, size, size, color)
    end

    def help(mode)
      text('up: S down: A', 10, 450, 1.0, color::CYAN)
      text('up: K down: J', 520, 450, 1.0, color::CYAN) unless mode == Mode::SINGLE
    end

    def pause
      text('PAUSE', half_height-74, half_width-30, 3.0)
    end

    def start
      text('SELECT MODE (PRESS KEY A OR B):', half_width-160, half_height-20, 1.8)
      text('A) SINGLE PLAYER', half_width-30, half_height+30, 1.6, color::BLUE)
      text('B) TWO PLAYERS', half_width-30, half_height+80, 1.6, color::BLUE)
      text('PING PONG', half_height-155, half_width-120, 4.0, color::RED)
    end

    def scores(player1, player2)
      text("Score: #{player1.score}", 10, 10, 1.0, color::YELLOW)
      text("Score: #{player2.score}", 540, 10, 1.0, color::YELLOW)
    end

    def half_height
      @window.half_height 
    end

    def half_width
      @window.half_width 
    end

    def color
      Gosu::Color
    end
  end
end

