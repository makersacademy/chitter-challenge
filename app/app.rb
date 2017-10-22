ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './app/models/peep'
require './app/data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
  @peeps = Peep.all
  erb :'peeps/index'
  end

  get'/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(name: params[:name], username: params[:username],
    message: params[:message], time: Time.new.strftime("%I:%M%p"))
    redirect '/peeps'
  end

  get '/maker/new' do
    @maker = Maker.new
    erb :'maker/new'
  end

  post '/makers' do
    @maker = Maker.create(name: params[:name], username: params[:username],
      email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      if @maker.save
        session[:maker_id] = @maker.id
    redirect to ('/peeps')
    else
      flash.now[:errors] = @maker.errors.full_messages
      erb :'maker/new'
    end
  end

  get '/sessions/new' do
  erb :'sessions/new'
  end

  post '/sessions' do
    maker = Maker.authenticate(params[:email], params[:password])
       if maker
         session[:maker_id] = maker.id
         redirect to('/peeps')
       else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
  end
end

  helpers do
    def current_maker
      @current_maker ||= Maker.get(session[:maker_id])
    end
  end

end
