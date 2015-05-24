require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'

require './app/models/user'
require './app/models/peep'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

helpers do

  def prepare_feed
      @all_peeps = Peep.all
      @all_peeps.reverse!
      @all_users = User.all
  end

  def prepare_public_feed
    @public_feed = []
    prepare_feed
    @all_peeps.each do |peep|
      if peep.personal_message_to == 'public'
        @public_feed << peep
      end
    end
  end

  def prepare_private_feed(sender, receiver)
    @private_feed = []
    @sender = sender
    @receiver = receiver
    prepare_feed
    @all_peeps.each do |peep|
      if (peep.personal_message_to == @receiver && peep.personal_message_from == @sender) || (peep.personal_message_to == @sender && peep.personal_message_from == @receiver)
        @private_feed << peep
      end
    end
  end

  def create_peep(sender, receiver)
    time = Time.now
    message = params[:message]
    if message && message.length > 140
      flash[:error] = 'Peeps must be less than 140 characters'
      redirect to '/main'
    end
    @sender = sender
    @receiver = receiver
    Peep.create(message: message,
                time: time,
                user_id: session[:id],
                personal_message_to: @receiver,
                personal_message_from: @sender)
  end

end

get '/' do
  prepare_public_feed
  erb :index
end

get '/about' do
  erb :about
end

get '/signup' do
  @user = User.new
  erb :signup
end

post '/signup' do
  @user = User.create(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation],
                      name: params[:name],
                      username: params[:username])
  if @user.save
    session[:id] = @user.id
    flash[:notice] = 'Registration confirmed'
    redirect '/'
  else
    flash.now[:error] = @user.errors.full_messages
    erb :signup
  end
end

post '/login' do
  username = params[:username]
  password = params[:password]
  user = User.authenticate(username, password)
  if user
    session[:id] = user.id
    redirect to '/main'
  else
    flash[:error] = 'The username or password was incorrect'
    redirect to '/'
  end
end

get '/main' do
  id = session[:id]
  user = User.get(id)
  if user == nil
    flash[:error] = 'Please login first'
    redirect to '/'
  end
  @name = user.name
  prepare_public_feed
  erb :mainpage
end

post '/main' do
  user = User.get(session[:id])
  create_peep(user.name, 'public')
  prepare_public_feed
  erb :mainpage
end

get '/main/private' do
  user = User.get(session[:id])
  @sender = user.name
  prepare_private_feed
  erb :private_peep
end

post '/main/private/person' do
  user = User.get(session[:id])
  @sender = user.name
  @receiver = params[:maker]
  prepare_private_feed(@sender, @receiver)
  erb :private_peep
end

post '/main/private' do
  user = User.get(session[:id])
  create_peep(user.name, params[:receiver])
  prepare_private_feed(user.name, params[:receiver])
  erb :private_peep
end

delete '/session' do
  flash[:notice] = 'Goodbye!'
  session[:id] = nil
  redirect to '/'
end