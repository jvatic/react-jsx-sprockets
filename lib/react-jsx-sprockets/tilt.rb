require 'tilt'

module ReactJSXSprockets
  class Tilt < Tilt::Template
    self.default_mime_type = 'application/javascript'

    CompileError = Class.new(StandardError)

    def evaluate(scope, locals, &block)
      self.call(data:data)
    end

    def prepare; end

    # new sprockets expects a proc rather than tilt
    def self.call(input)
      begin
        output = JSX.compile(input[:data])
      rescue ExecJS::RuntimeError => e
        raise CompileError.new("ReactJSXSprockets: Failed to compile: #{e.inspect}")
      end

      output
    end
  end
end
