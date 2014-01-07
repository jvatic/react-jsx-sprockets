require 'execjs'

module ReactJSXSprockets
  module JSX
    extend self

    def compile(source, options = {})
      result = context.call('JSXTransformer.transform', source)
      return result['code']
    end

    private

    def context
      @context ||= begin
        # If execjs uses therubyracer, there is no 'global'. Make sure
        # we have it so JSX script can work properly.
        contents = 'var global = global || this;' + source
        ExecJS.compile(contents)
      end
    end

    def source
      @source ||= File.read(path)
    end

    def path
      @path ||= File.join(assets_path, 'javascripts', 'jsx.js')
    end

    def assets_path
      @assets_path ||= File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'vendor', 'assets'))
    end
  end
end
