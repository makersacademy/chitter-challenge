
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'thin'
require_relative './datamapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(20) }

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def parse_hashtags(peep_body)
      body = peep_body.delete(',.?!;:')
      array = body.split(' ')
      array.each do |word|
        Hashtag.create(tag: word) if word[0] == '#'
      end
    end

    def peep_time(timestamp)
      today = Time.now
      peep_date = "#{timestamp.day}#{timestamp.month}#{timestamp.year}".to_i
      todays_date = "#{today.day}#{today.month}#{today.year}".to_i
      if peep_date == todays_date && today.strftime('%H').to_i != timestamp.strftime('%H').to_i
        hours_elapsed = today.strftime('%H').to_i - timestamp.strftime('%H').to_i
        "#{hours_elapsed}h"
      elsif peep_date == todays_date && today.strftime('%H').to_i == timestamp.strftime('%H').to_i
        minutes_elapsed = today.strftime('%M').to_i - timestamp.strftime('%M').to_i
        "#{minutes_elapsed}m"
      else
        timestamp.strftime('%b %-d')
      end
    end

  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.create(body: params[:body],
     charcount: params[:body].length,
     likes: 0,
     time: Time.now,
     user_id: session[:user_id])
    parse_hashtags(params[:body])
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/create_user' do
    user = User.create(first_name: params[:first_name],
     last_name: params[:last_name],
     email: params[:email],
     username: params[:username],
     password: params[:password],
     password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/login' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      erb :index
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/peep' do
    erb :peep
  end

  run! if __FILE__ == $PROGRAM_NAME
end
