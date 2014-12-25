# EasyCdn

This is a gem for easy cdn support of any library whatsoever for Ruby on Rails
It generates link or script tags for the specified files.

##WARNING
##Here be dragons!
The gem is not yet tested and is still a work in progress! Use in on your own risk!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_cdn'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_cdn

## Usage

First specify which files you want to be 'cdn'-ed like this:

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

Then just add
 <%= easy_cdn 'filetype', options_hash %>

Wherever you want the link or script tags included

The filetype argument could be:
  1. 'all' - this is by default
  2. 'js'
  3. 'css'

The options_hash argument would be used for creating tag attributes for the 
generated tags e.g

<%= easy_cdn 'css', 'data-turbolinks-track' => true %>

would generate
&lt link href="the-link-configured-for-a-css-file" data-turbolinks-track="true" &gt

## Contributing

1. Fork it ( https://github.com/[my-github-username]/easy_cdn/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
