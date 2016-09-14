require 'react-jsx-sprockets/version'

module ReactJSXSprockets
  extend self

  require 'react-jsx-sprockets/jsx'
  require 'react-jsx-sprockets/tilt'

  DEFAULT_EXTENTIONS = %w( jsx ).freeze

  def template_extensions
    @template_extensions ||= DEFAULT_EXTENTIONS
  end

  ##
  # Register extention(s) with Sprockets
  require 'sprockets'
  ReactJSXSprockets.template_extensions.each do |ext|
    if Sprockets.respond_to?(:register_engine)
      args = [".#{ext}", Tilt]
      args << { mime_type: "application/#{ext}", silence_deprecation: true } if Sprockets::VERSION.start_with?("3")
      Sprockets.register_engine(*args)
    end

    Sprockets.register_mime_type "application/#{ext}",  extensions: [".js.#{ext}",".#{ext}"], charset: :unicode
    Sprockets.register_transformer "application/#{ext}", Tilt.default_mime_type, Tilt
  end
end
