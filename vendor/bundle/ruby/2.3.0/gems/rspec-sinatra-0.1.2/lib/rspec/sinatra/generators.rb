require 'templater'

module RSpec
  module Sinatra
    module Generators
      extend Templater::Manifold

      class InitGenerator < Templater::Generator
        def self.source_root
          File.join(File.dirname(__FILE__), 'templates')
        end

        desc <<-DESC
          Initialize an rspec environment for a sinatra application.
            rspec-sinatra MyApp lib/myapp.rb
        DESC

        first_argument :app_class, :required => true, :desc => 'Application class'
        second_argument :app_file, :required => true, :desc => 'Application file'

        option :app, :as => :boolean, :default => false, :desc => 'Create the application files as well.'

        template :spec_helper, 'spec/spec_helper.rb'

        template :app_file, 'app.rbt', '%app_file_path%', :app => true
        template :rackup_file, 'config.ru', 'config.ru', :app => true

        def app_file_path
          app_file
        end
      end

      desc "Generators to simplify the usage of rspec with sinatra."
      add :init, InitGenerator
    end
  end
end
