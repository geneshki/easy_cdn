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
        tag = TAG_NAMES.fetch(resource.fetch(:ext).to_sym);
        if tag.nil? then
          tag = ['script', 'src']
        end
        if filetype == "all" or resource.fetch(:ext).eql?(filetype) then
          cdn = resource.fetch(:cdn)
          lib = resource.fetch(:lib)
          ext = resource.fetch(:ext)
          src = prep_path cdn, lib, ext 
          tags += "<#{tag[0]} #{tag[1]}='#{src}' #{attributes}></#{tag[0]}>\n"
        end
      tags
    end
    def prep_path(cdn, lib, ext)
      result = ""
      parts = []
      if lib then
        if ENVIRONMENT.development? or ENVIRONMENT.test?
          parts = [
            '/assets/',
            lib,
            '.',
            ext,
          ]
          result = parts.join
        else
          parts = [
            cdn,
            lib,
            '.min.',
            ext,
          ]
          result = parts.join 
        end
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
