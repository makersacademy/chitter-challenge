require_relative '../data_mapper_setup'
require 'sinatra/partial'

module Turing
  module Routes
    class Base < Sinatra::Base
      enable :sessions
      register Sinatra::Flash
      register Sinatra::Partial
      set :session_secret, 'super secret'
      use Rack::MethodOverride
      set :views, proc { File.join(root, '..', 'views') }

      set :partial_template_engine, :erb
      
      helpers do
      def current_user
        User.get(session[:user_id])
      end

      def token_generator
        (0...30).map { (65 + rand(26)).chr }.join
      end
      end

    end
  end
end