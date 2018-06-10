require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
    enable :sessions
    get '/' do
        @peeps = Peep.all.reverse
        erb :index
    end
    
    get '/peeps' do
        @user = User.find(session[:user_id])
        @peeps = Peep.all.reverse
        erb :"peeps/index"
    end

    post '/new' do
        peep = params['content']
        Peep.create(content: peep)
        redirect '/'
    end

    get '/signup' do
        erb :signup
    end

    post '/signup' do
        user = User.create(
            display_name: params['display_name'],
            username: params['username'],
            email: params['email'],
            password: params['password']
        )
        session[:user_id] = user.id
        redirect '/peeps'
    end
end