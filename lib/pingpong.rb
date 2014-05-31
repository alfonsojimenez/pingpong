require 'rubygems'
require 'bundler'

Bundler.setup

require 'gosu'
require 'pathname'

require 'pingpong/ball'
require 'pingpong/direction'
require 'pingpong/game'
require 'pingpong/player'
require 'pingpong/status'
require 'pingpong/text'

module Pingpong
  include Gosu

  VERSION = '0.0.1'
  
  class << self
    def root
      @root ||= Pathname.new(File.dirname(File.expand_path('../', __FILE__)))
    end

    def assets_dir(asset)
      root.join('assets', asset).to_s
    end
  end
end

