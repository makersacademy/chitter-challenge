require 'sinatra/base'
require 'sinatra/flash'
require 'time_ago_in_words'
require_relative '../data_mapper_setup'

module Routes

    class BaseController < Sinatra::Base
        set :views, proc { File.join(root, '..', 'views') }
        enable :sessions
        set :session_secret, "top secret"
        use Rack::MethodOverride
        register Sinatra::Flash

        helpers do
            def current_maker
                @current_maker ||= Maker.get(session[:maker_id])
            end

            def format_time(peep_time)
                Time.parse(peep_time.to_s).time_ago_in_words
            end

            def format_date(peep_date)
                Date.parse(peep_date.to_s).date_ago_in_words
            end

        end

        run! if app_file == $PROGRAM_NAME

    end
end