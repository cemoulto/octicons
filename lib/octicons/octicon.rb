module Octicons
  class Octicon
    def initialize(options)
      @options = options
      if symbol = Octicons::OCTICON_SYMBOLS[@options[:symbol]]
        @path = symbol[:path]
        @width = symbol[:width]
        @height = symbol[:height]

        css_class
        compute_size
        accessible

        # clean options
        @options.delete(:symbol)
        @options.delete(:tag)
        @options.delete(:size)
      else
        raise "Couldn't find octicon symbol for #{options[:symbol].inspect}"
      end
    end

    def to_svg
      "<svg #{html_attrs}>#{@path}</svg>"
    end

    private

    def html_attrs
      attrs = ""
      @options.each { |attr, value| attrs += "#{attr}=\"#{value}\" " }
      attrs.strip
    end

    # add some accessibility features to svg
    def accessible
      @options[:version] = "1.1"

      if @options[:'aria-label'].nil?
        @options[:'aria-hidden'] = "true"
      else
        @options[:role] = "img"
      end
    end

    # prepare the octicon class
    def css_class
      @options[:class] = "octicon octicon-#{@options[:symbol]} #{@options[:class]} ".strip
    end

    # determine the height and width of the octicon based on :size option
    def compute_size

      @options[:viewBox] = "0 0 #{@width} #{@height}"

      if !@options[:width].nil? && !@options[:height].nil?

      elsif @options[:size] == "large"
        @options[:width] = 2 * @width
        @options[:height] = 2 * @height

      elsif @options[:size].is_a? Integer
        @options[:width] = (@options[:size] * @width) / @height
        @options[:height] = @options[:size]

      else
        @options[:width] = @width
        @options[:height] = @height

      end
    end
  end
end
