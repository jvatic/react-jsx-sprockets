# ReactJSXSprockets

**ReactJSXSprockets** compiles your [React JSX](http://facebook.github.io/react/docs/jsx-in-depth.html) files in your [Sprockets](https://github.com/sstephenson/sprockets) environment.

## Installation

Add this line to your `Gemfile`:

    gem 'react-jsx-sprockets'

And then execute:

    $ bundle

## Usage

```ruby
ReactJSXSprockets.configure do |config|
  config.extensions = %w( jsx )
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
