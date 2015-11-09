require 'sinatra/base'
require 'sinatra/flash'
require 'time_ago_in_words'
require_relative '../data_mapper_setup'

module Routes

  class BaseController < Sinatra::Base
    set :views, proc { File.join(root, '..', 'views') }
    enable :sessions
    set :session_secret, 'super secret'
    use Rack::MethodOverride
    register Sinatra::Flash

    helpers do

     def current_maker
       @current_maker ||= Maker.get(session[:maker_id])
     end

     def format_time(peep_time)
       Time.parse(peep_time.to_s).ago_in_words
     end

    end

     run! if app_file == $PROGRAM_NAME
  end

end
