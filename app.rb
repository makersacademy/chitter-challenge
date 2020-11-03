require 'sinatra/base'
require 'sinatra/flash'

require_relative './database_setup.rb'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class ChitterApp < Sinatra::Base
    enable :sessions
   

    get '/' do
      @peeps = Peep.get_peeps
        erb(:index)
    end

    post '/new' do
       @user = User.find(session[:user_id])
       Peep.add_peeps(params['message'], Time.now, @user.username, @user.name)
       
       redirect '/signed_in'
    end

    get '/sign_in/new' do
        erb(:sign_in)
    end

    get '/log_in/new' do
        erb(:log_in)
    end

    post '/log_in' do
        session[:user] = User.authenticate(username: params[:username], password: params[:password])
        session[:user_id] = User.authenticate(username: params[:username], password: params[:password]).id
        if session[:user] != nil
          redirect '/signed_in'
        else
          redirect '/'
        end
    end

    post '/sign_up' do
       
       user = User.create(username: params['username'], name: params['name'], password: params['password'], email: params['email'])
       session[:user_id] = user.id
       redirect '/signed_in'
       
    end

    get '/signed_in' do
        @peeps = Peep.get_peeps
       # @user = User.find(session[:user_id])
        erb(:signed_in)
    end

end
