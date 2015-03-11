# EasyCdn

This is a gem for easy cdn support of any library whatsoever for Ruby on Rails
It generates link or script tags for the specified files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_cdn', :git => 'git://github.com/insignificantMe/easy_cdn.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_cdn

## Usage

First specify which files you want to be 'cdn'-ed like this:

```ruby
Rails.application.config.assets.easy_cdn_config = [
  {
    libs: [ {
      name: 'jquery',
      version: Jquery::Rails::JQUERY_VERSION,
      ext: 'js'
    }],
    cdn: '//ajax.googleapis.com/ajax/libs/jquery/',
  },
]
```

Then just add
```ruby
 <%= easy_cdn 'filetype', options_hash %>
```

Wherever you want the link or script tags included

The filetype argument could be:
```
  1. 'all' - this is by default
  2. 'js'
  3. 'css'
```

The options_hash argument would be used for creating tag attributes for the 
generated tags e.g

```ruby
<%= easy_cdn 'css', 'data-turbolinks-track' => true %>
```
would generate

```html
<link href="the-link-configured-for-a-css-file" data-turbolinks-track="true">
```

## Contributing

1. Fork it ( https://github.com/insignificantMe/easy_cdn/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Trivia
This gem was created because while developing http://yetanotherprettifier.com/
I found only tailored cdn gems and not a single generic one. I hope it would be
useful.
