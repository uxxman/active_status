module HealthStatus
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Creates RailsHealthStatus initializer and add route for your application'

      def self.default_generator_root
        __dir__
      end

      def copy_initializer
        template 'initializer.rb', 'config/initializers/health_status_config.rb'
      end

      def add_route
        route "mount RailsHealthStatus::Engine => '/status'"
      end
    end
  end
end
