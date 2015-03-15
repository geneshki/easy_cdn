module EasyCdn
  module EasyCdnHelper
    TAG_NAMES = {
      js: ['script', 'src'],
      css: ['link', 'href']
    }

    private
    class EasyCdnEnv
      def initialize
        @frozen = ENV["RAILS_ENV"].eql? "production"
        @env = ENV["RAILS_ENV"]
      end
      def env=(env)
        if env.eql? "test" or env.eql? "development" or env.eql? "production" then
          p env
          @env = env
        else
          raise "Invalid Rails Environment!"
        end unless @frozen
      end
      def test?
        @env.eql? "test"
      end
      def development?
        @env.eql? "development"
      end
      def production?
        @env.eql? "production"
      end
    end
    public

    ENVIRONMENT = EasyCdnEnv.new

  end
end
