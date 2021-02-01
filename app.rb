require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
    enable :sessions

    get '/' do
        erb :'peeps/index'
    end

    get '/peeps' do
        @user = session[:user_id] == "" ? nil : User.find(id: session[:user_id])
        @peeps = Peep.all.reverse
        erb :'peeps/list'
    end

    post '/peeps' do
        Peep.post(message: params['message'])
        redirect '/peeps'
    end

    get '/peeps/new' do
        erb :'peeps/new'
    end

    get '/users/new' do
        erb :'users/new'
    end

    post '/users' do
        user = User.create(email: params['email'], password: params['password'])
        session[:user_id] = user.id
        redirect '/peeps'
    end

    run! if app_file == $0

end
