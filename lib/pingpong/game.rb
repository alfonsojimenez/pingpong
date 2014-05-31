module Pingpong
  class Game < Gosu::Window
    HEIGHT = 640
    WIDTH = 480

    def initialize
      super(HEIGHT, WIDTH, false)
      self.caption = "Pingpong #{Pingpong::VERSION}"

      @background = Gosu::Image.new(self, Pingpong.assets_dir('background.png'))

      init_players
      init_ball

      @status = Status::STOP
    end

    def init_players
      @player1 = Player.new(self, x: 40, y: half_width)
      @player2 = Player.new(self, x: HEIGHT-40, y: half_width)
    end

    def init_ball
      @ball = Ball.new(self, @player1, @player2, x: half_height, y: half_width)
    end

    def playing?
      @status == Status::PLAY
    end

    def paused?
      @status == Status::PAUSE
    end

    def stop?
      @status == Status::STOP
    end

    def toggle_status
      @status = playing? ? Status::PAUSE : Status::PLAY
    end

    def update
      if button_down?(Gosu::KbSpace)
        toggle_status
        sleep 0.3
      end

      if playing?
        @ball.move

        @player1.move_down if button_down?(Gosu::KbA)
        @player1.move_up if button_down?(Gosu::KbS)

        @player2.move_down if button_down?(Gosu::KbJ)
        @player2.move_up if button_down?(Gosu::KbK)

        @player1.move
        @player2.move
      end
    end

    def draw
      @player1.draw
      @player2.draw
      @ball.draw
      @background.draw(0, 0, 0)

      text.pause if paused?
      text.start if stop?
      text.scores(@player1, @player2)
      text.help
    end

    def text
      @text ||= Text.new(self)
    end

    def half_width
      @half_width ||= WIDTH/2
    end

    def half_height
      @half_height ||= HEIGHT/2
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end
  end
end

