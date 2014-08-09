require "daylimotion/player/version"

module Daylimotion
  module Player
    def self.player video_id
      Player.new video_id
    end

    class Player
      def initialize video_id
        @video_id = video_id
      end

      def html
        "todo"
      end
	end
  end
end
