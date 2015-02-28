require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/peep'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

set :public_folder, Proc.new { File.join(root, '..', "public") }
enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb

get '/' do
  @peeps = Peep.all
  erb :index
end

get '/peeps/new' do
  erb :"peeps/new"
end

post '/peeps' do
  content = params["content"]
  Peep.create(:content => content)
  redirect to('/')
end

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(:email => params[:email],
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/sessions/new' do 
  erb :"sessions/new"
end

post '/sessions' do
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ["The email or password is incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  flash[:notice] = "Good bye!"
  session[:user_id] = nil
  redirect to('/')
end

#<div class='title' ><%= peep.content %></div>

# <div id='peeps-container'>
#   <ul id='peeps'>
#     <% @peeps.each do |peep| %>
#       <%= partial :peep, :locals => {:peep => peep}  %>
#     <% end %>
#   </ul>  
# </div>