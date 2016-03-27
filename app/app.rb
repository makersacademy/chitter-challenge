ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :home
  end

  get '/maker/new' do
    erb :'/maker/new'
  end

  post '/register' do
    @maker = Maker.create(name: params[:name],
                 username: params[:username],
                 email:    params[:email],
                 password: params[:password],
                 password_confirmation: params[:password_confirmation])
    if @maker.save
      session[:maker_id] = @maker.id
      redirect '/peeps/read'
    else
      flash.now[:error] = @maker.errors.full_messages
      erb :'maker/new'
    end
  end

  get '/session/new' do
    erb :'/session/new'
  end

  post '/session' do
    maker = Maker.authenticate(params[:username], params[:password])
    if maker
      session[:maker_id] = maker.id
      redirect '/peeps/read'
    else
      flash.now[:error] = ['Email & Password combo is wrong!']
      erb :'/session/new'
    end
  end

  get '/peeps/read' do
    # Maker.get(session[:maker_id])
    @maker = current_maker
    erb :'peeps/read'
  end

  post '/peeps/new' do
    maker = Maker.get(session[:maker_id])
    maker.peeps.create(text: params[:text])
    redirect '/peeps/read'
  end

  delete '/session' do
    session[:maker_id] = nil
    flash.keep[:message] = 'Bye!'
    redirect '/'
  end

  helpers do
    def current_maker
      @current_maker ||= Maker.get(session[:maker_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
