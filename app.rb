require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require 'uri'

class ChitterClallenge < Sinatra::Base
    
    register Sinatra::Flash
    enable :sessions


    get '/' do
        @user = User.find(session[:user_id])
        @peeps = Peep.read
        erb :index
    end

    
    post '/' do
        oops = 'you peeped too long!'
        flash[:notice] = oops unless Peep.create(peep: params['peep'])
        redirect '/'
    end


    get '/signup' do
        erb :signup
    end


    post '/signup' do
        user = User.create( email: params['email'],
                            password: params['password'],
                            username: params['username'] )
        session[:user_id] = user.id
        redirect '/'
    end


    error 404 do
        '404'
    end


    run! if app_file == $PROGRAM_NAME

end
