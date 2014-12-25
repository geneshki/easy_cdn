module EasyCdn
  module EasyCdnHelper 
    def easy_cdn(filetype = "all", options = {})
      cdn_resources = Rails.application.config.assets.easy_cdn_config
      tags = ""
      attributes = prep_options options
      cdn_resources.each do |resource|
        tags += prep_tags(resource, filetype, attributes)
      end
      tags.html_safe
    end
    def prep_tags(resource, filetype, attributes)
      tags = ""
      resource.fetch(:libs).each do |lib|
        tag = TAG_NAMES.fetch(lib.fetch(:ext));
        if tag.nil? then
          tag = ['script', 'src']
        end
        if filetype == "all" or lib.fetch(:ext).eql?(filetype) then
          src = prep_path resource.fetch(:cdn), lib
          tags += "<#{tag[0]} #{tag[1]}='#{src}' #{attributes}></#{tag[0]}>\n"
        end
      end
      tags
    end
    def prep_path(cdn, lib)
      result = ""
      if lib then
        parts = []
        if Rails.env.development? or Rails.env.test?
          parts = [
            '/assets/',
            lib.fetch(:name),
            '.'
          ]
        else
          parts = [
            cdn,
            lib.fetch(:version),
            lib.fetch(:name),
            '.min.'
          ]
        end
          result += parts.join
          result += lib.fetch(:ext)
      end
      result
    end

    def prep_options(options)
      result = ""
      if !options.empty?
        options.each do |key, value|
          result += "#{key}='#{value}'"
        end
      end
      result
    end
  end
end
