ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/dm_setup'

class TwitTwoo < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :sessions_secret, 'super secret'

  before do
    p params
  end

  helpers do
    def current_owl
      @current_owl ||= Owl.get(session[:owl_id])
    end
  end

  get '/' do
    erb :index
  end

  post '/register' do
    @owl = Owl.create(name: params[:name], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation], email: params[:email])
    if @owl.id
      session[:owl_id] = @owl.id
      redirect "/owl/#{params[:username]}/nest"
    else
      flash.now[:error] = @owl.errors.full_messages
      erb :'user/register'
    end
  end

  get '/owl/:username/nest' do
    @owl = Owl.first(name: params[:username])
    erb :'user/nest'
  end

  post '/twit' do
    twit = Twit.create(content: params[:twit])
    current_owl.twits << twit
    redirect "/owl/#{current_user.name}/nest"
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end