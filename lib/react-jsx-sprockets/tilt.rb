require 'tilt'

module ReactJSXSprockets
  class Tilt < Tilt::Template
    self.default_mime_type = 'application/javascript'

    CompileError = Class.new(StandardError)

    def evaluate(scope, locals, &block)
      begin
        output = JSX.compile(data)
      rescue ExecJS::RuntimeError => e
        raise CompileError.new("ReactJSXSprockets: Failed to compile: #{e.inspect}")
      end

      output
    end

    def prepare; end
  end
end
