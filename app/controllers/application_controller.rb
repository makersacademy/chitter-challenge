require 'sinatra/base'
require './app/models/peep.rb'

class ApplicationManager < Sinatra::Base

  configure do
    enable :sessions
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/' do
    erb(:index)
  end

  post '/create_post' do
    Peep.add(message: params[:peep])
    redirect('/posts')
  end

  get '/posts' do
    @peeps_list = Peep.list
    erb(:posts)
  end

  run! if app_file == $0
end
