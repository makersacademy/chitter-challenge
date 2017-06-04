ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end

 end

 get ('/') do
   erb :login
 end

get('/peeps') do
  @chits
  @chits = Peep.all(:order => [ :time.desc ])
  erb :peeps
end

get('/add') do
  erb :add
end

post ('/peeps') do
  erb :add
  peep = Peep.create(content: params[:content], time: Time.new, user_id: session[:user_id] )
  redirect '/peeps'
end

get '/signup' do
  erb :signup
end

post '/newuser' do
  user = User.create(email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect '/peeps'
end

post '/checkuser' do
  user ||= User.first(:email => params[:email])
  if user && user.password == params[:password]
     session[:user_id] = user.id
     redirect '/peeps'

    else
      redirect '/signup'
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

end
