module Octicons
  module Helpers

    # Public: Helper for creating octicons. We're using this to inject svg icons.
    #
    # options - These are normal tag options for the rendered tag, plus some extras
    #    symbol (required) - This is the icon symbol name, for example "arrow-left", leave off the "octicon-"
    #    size (optional default normal) - This will help output 16 or 32 sized icons. You can also pass an Integer to this, for other sizes
    #    width (optional) -
    #    height (optional) - width and height are exact sizes, if you have an odd shape like the gist logo, pass in exact dimensions
    #
    # Examples
    #
    #  <%= octicon(:symbol => 'arrow-left') %>
    #  <%= octicon(:symbol => 'arrow-left', :size => 'large') %>
    #  <%= octicon(:symbol => 'arrow-left', :size => 24, :'aria-label' => 'A left arrow', :class => 'text-muted left') %>
    #
    # returns rendered tag for octicon
    def octicon(options = {})
      return nil if options[:symbol].nil?
      icon = Octicon.new(options)
      icon.to_svg
    end

    module_function :octicon
  end
end
