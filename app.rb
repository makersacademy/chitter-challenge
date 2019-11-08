require 'sinatra/base'
require './src/DbHelper'
require './src/User'
require './src/Post'

class Chitter < Sinatra::Base
    enable :sessions

    get '/' do 
        redirect '/login'
    end

    get '/login' do
        erb(:login)
    end

    post '/load_user' do
        email = params[:email]
        result = DbHelper.get_exac(email)
        @current_user = User.convert_to_user(result)
        session[:user] = @current_user
        redirect '/view'
    end

    get '/view' do
        @peeps = DbHelper.get_peeps

        @posts = Post.convert_to_post(@peeps)

        p @posts[0].poster

        @current_user = session[:user]
        erb(:home)

    end 

    get '/create' do
        @time = Time.new
        @current_user = session[:user]

        erb(:create_post)
    end

    post '/generate_post' do
        
    end



    run! if app_file == $0
end 