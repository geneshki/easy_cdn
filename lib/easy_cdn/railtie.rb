require 'easy_cdn/easy_cdn_helper'
module EasyCdn
  class Railtie < Rails::Railtie
    initializer "easy_cdn.easy_cdn_helper" do
      ActionView::Base.send :include, EasyCdnHelper
    end
  end
end
