require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  get '/sign_up' do 
    return erb(:sign_up)
  end

  post '/sign_up' do 
    user_repo = UserRepository.new
    new_user = User.new
    new_user.email = params[:email]
    new_user.pass_word = params[:pass_word]
    new_user.username = params[:username]
    new_user.full_name = params[:full_name]

    user_repo.create(new_user)
  end 
end
