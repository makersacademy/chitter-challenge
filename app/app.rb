ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_maker
      @current_maker ||= Maker.get(session[:maker_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/peep/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    peep = Peep.first_or_create(content: params[:content], maker_id: current_maker.id)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/makers/new' do
    erb :'makers/new'
  end

  post '/makers' do
    @maker = Maker.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @maker.save
      session[:maker_id] = @maker.id
      redirect '/makers'
    else
      flash.now[:errors] = @maker.errors.full_messages
      erb :'makers/new'
    end
  end

  get '/makers' do
    @maker_email = current_maker.email
    erb :'makers/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    maker = Maker.authenticate(params[:email], params[:password])
    if maker
      session[:maker_id] = maker.id
      redirect to('/makers')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:maker_id] = nil
    flash.next[:notice] = 'goodbye!'
    redirect to '/'
  end

end
