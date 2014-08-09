require "daylimotion/player/version"

module Daylimotion
  module Player
    def self.player video_id
      Player.new video_id
    end

    class Player
      @width = 512
      @height = 360
      @allow_fullscreen = true
      @embed_url = nil

      attr_accessor :logo, :autoplay

      def initialize video_id = nil
        @video_id = video_id
      end

      def html
        attributes = build_attribues
        allowfullscreen = @allow_fullscreen ? ' allowfullscreen' : ''
        video_url = @video_id ? "http://www.dailymotion.com/embed/video/#{@video_id}" : @embed_url
        "<iframe frameborder=\"0\" width=\"#{@width}\" height=\"#{@height}\" src=\"#{video_url}#{attributes}\"#{allowfullscreen}></iframe>"
      end

      def embed_url embed_url
        @embed_url = embed_url
        @video_id = nil
        self
      end

      def width width
        @width = width
        self
      end

      def height height
        @height = height
        self
      end

      def allowfullscreen
        @allow_fullscreen = true
      end

      def disablefullscren
        @allow_fullscreen = false
      end

      def prepare_attributes
        result = {}
        if defined? @autoplay
          result[:autoplay] = @autoplay
        end
        if defined? @logo
          result[:logo] = @logo
        end
        result
      end

      def build_attribues
        attributes = prepare_attributes
        if attributes.empty?
          return ''
        end

        result = []
        attributes.each do |key, value|
          result << "#{key}=#{value}"
        end

        joined = result.join('&')
        "?#{joined}"
      end
    end
  end
end
