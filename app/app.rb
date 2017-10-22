ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  get '/peep/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.first_or_create(content: params[:content])
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
      redirect '/peeps'
    else
      flash.now[:notice] = 'Password and confirmation password do not match'
      erb :'makers/new'
    end
  end

  helpers do
    def current_maker
      @current_maker ||= Maker.get(session[:maker_id])
    end
  end

end
