require 'react-jsx-sprockets/version'

module ReactJSXSprockets
  extend self

  require 'react-jsx-sprockets/jsx'
  require 'react-jsx-sprockets/tilt'

  DEFAULT_EXTENTIONS = %w( jsx ).freeze

  attr_writer :extensions

  def configure
    yield(self)
  end

  def template_extensions
    @template_extensions ||= DEFAULT_EXTENTIONS
  end

  ##
  # Register extention(s) with Sprockets
  require 'sprockets'
  ReactJSXSprockets.template_extensions.each do |ext|
    Sprockets.register_engine ".#{ext}", Tilt
  end
end
