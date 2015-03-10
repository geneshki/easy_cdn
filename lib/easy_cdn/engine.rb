require 'easy_cdn/easy_cdn_helper'
module EasyCdn
  class Engine < Rails::Engine
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer "easy_cdn.easy_cdn_helper" do
      ActionView::Base.send :include, EasyCdnHelper
    end
  end
end
