require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require './models/users.rb'
require './models/peeps.rb'
require 'sinatra/flash'
class Chitter < Sinatra::Base
    enable :sessions
    register Sinatra::Flash
    
    get '/' do
        erb :index
    end

    get '/peeps/new' do
        erb :'peeps/new'
    end

    get '/sign_up' do
        erb :sign_up
    end
    
    get '/session/new' do
        erb :'session/new'
    end

    post '/session' do
        if User.where(email: params['email'], password: params['password']).exists?
            session[:user_id] = User.find_by(email: params['email']).id
            redirect '/peeps'
        else 
            flash[:notice1] = 'Wrong password - please try again'
            redirect '/session/new'
        end
    end

    post '/users' do
        User.create(name: params['username'], email: params['email'], password: params['password'])
        redirect '/'
    end

    post '/peeps' do
        Peep.create(content: params[:content], user: User.find_by(id: session[:user_id]))
        redirect('/peeps')
    end

    get '/peeps' do
        erb :peeps
    end

    post '/session/destroy' do
        session.clear
        flash[:notice2] = 'You have successfully signed out'
        redirect '/session/new'
    end

end