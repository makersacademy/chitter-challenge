ENV['RACK_ENV'] ||= 'development'

require 'dotenv'
Dotenv.load
require 'sinatra/base'
require 'data_mapper'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  include Emailer
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    @user = current_user #dont need this
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    message = params[:peep]
    peep = Peep.create(
      text: message, 
      posted_on: DateTime.now, # use databse timestamps
      user: current_user
    )
    tags = message.split.select { |w| w.start_with?('@') }  
    tags.each do |tag|
      user = User.first(handle: tag.delete('@')) #validation if user exists
      tag = Tag.create(
        peep: peep, 
        user: user
      )
      peep.tags << tag
      peep.save
      Emailer.send_tag_email(user) if user
    end
    redirect '/peeps'
  end

  get '/peeps/reply/:id' do
    @peep = Peep.get(params[:id])# validate reply id
    erb :'peeps/reply'
  end

  post '/peeps/reply/:id' do
    peep = Peep.get(params[:id])
    reply = Reply.create(
      peep: peep, 
      user: current_user, 
      text: params[:response],
      replied_on: DateTime.now
      )
    peep.replies << reply
    peep.save
    Emailer.send_reply_email(peep.user)
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      name: params[:name],
      handle: params[:handle],
      email: params[:email],
      password: params[:password]
      )
    session[:user_id] = user.id
    if user.save
      redirect '/peeps'
    else 
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  post '/sessions/new' do
    user = User.authenticate(
      params[:email],
      params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:notice] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
    
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/peeps'
  end

end
