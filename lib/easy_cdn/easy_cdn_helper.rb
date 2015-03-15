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
          cdn = resource.fetch(:cdn, '')
          lib = resource.fetch(:lib)
          ext = resource.fetch(:ext)
          local_dir = resource.fetch(:local_dir, '')
          src = prep_path cdn, lib, ext, local_dir 
          tags += "<#{tag[0]} #{tag[1]}='#{src}' #{attributes}></#{tag[0]}>\n"
        end
      tags
    end
    def prep_path(cdn, lib, ext, local_dir)
      result = ""
      parts = []
      if lib then
        if ENVIRONMENT.production? && cdn.present? then
          parts = [
            cdn,
            lib,
            '.min.',
            ext,
          ]
        else
          if local_dir.nil? or local_dir.empty? then
            parts = [
              '/assets/',
              lib,
              '.',
              ext,
            ]
          else
            parts = [
              '/assets/',
              local_dir,
              '/',
              lib,
              '.',
              ext,
            ]
          end
        end
        result = parts.join 
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
