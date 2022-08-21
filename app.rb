require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'


class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :"users/sign_up"
  end
#the initial redirect or homepage should show the options to either login or signup
# Being a member is the conditioin to post/create a peep
# However, anyone can see all peeps

# the '/' should show all peeps, so it should redirect to /peeps, which shows a nav bar 
# its not a cloud database, it should be a cloud database
# dont think about the database until you absolutely have to.
# Figure out the routes.
# Look into inputting an ORM, after everything is fixed.
# 1.reconfigure the routes properly
# 2.reconfigure the routes properly

# It doesnt make sense to design things from the inside out, only at some point - 
# It is a mannequin, but it doesnt really function. 
# We would at least know the routes work...

  post '/users/new' do
    # @user = User.create(params[:username]
    # @user = session[:username]
    session[:username] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/users/sign_up'
  end

  get '/users/sign_up' do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    # @user = User.create(params[:username])
    erb :"users/user_homepage"
  end 

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/all'
  end 

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/peeps'
  end


  run! if app_file == $0
end



