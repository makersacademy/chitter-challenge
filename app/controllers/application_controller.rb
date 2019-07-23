require 'sinatra/base'
require './app/models/peep.rb'

# class for control of client interaction with server,
class ApplicationManager < Sinatra::Base
  configure do
    enable :sessions
    set :views, 'app/views'
    set :public_dir, 'public'
  end

  get '/' do
    erb(:index)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    erb(:sign_up_confirmation)
  end

  get '/home' do
    erb(:home)
  end

  post '/create_post' do
    Peep.post(message: params[:peep])
    redirect('/posts')
  end

  get '/posts' do
    @peeps_list = Peep.list
    erb(:posts)
  end

  run! if app_file == $PROGRAM_NAME
end
