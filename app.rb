require 'sinatra/base'
require './lib/maker_peep.rb'
require './lib/maker_sign_up.rb'

#use routes overview for what to call the different routes

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @maker = MakerPeep.all
    erb :list_of_peeps
    #will also need a login button that goes directly to the login page.
    ## we be multiple routes and conditionals
    #shows list of peeps before you need to sign up. Goes to sign_up button
    #also cannot show add_peep until user has signed up and logged in - this button can only be viewed if user logged in.
    #use conditional here = if logged in, display logout button (and vise versa) --
    #may need another table (user logged in or out)
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    #work out how to do astorix for password
    MakerProfile.signup(username: params[:username], name: params[:name], email: params[:email],
    password: params[:password])
    redirect '/login'
  end



  get '/login' do
    MakerProfile.login(username: params[:username], password: params[:password])
    erb :login
  end

  post '/login' do
    MakerProfile.login(url: params[:url], title: params[:title])
    redirect '/'
  end



   #now shows all the features to add peep
  end

  get '/add_peep' do
    erb :add_peep
    redirect '/'
    #see peep
  end
end
