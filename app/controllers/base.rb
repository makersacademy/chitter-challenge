require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative '../data_mapper_setup'

module Chitter

  module Routes

    class Base < Sinatra::Base

      use Rack::MethodOverride
      enable :sessions
      register Sinatra::Flash
      register Sinatra::Partial
      set :partial_template_engine, :erb
      set :session_secret, 'super secret'
      set :views, proc { File.join(root, '..', 'views')}

      helpers do

       def current_user
         @current_user ||= User.get(session[:user_id])
       end

       def current_peep
         @current_peep ||= Peep.get(session[:peep_id])
        #  if session[:peep_id]
       end

      end

    end

  end

end
