require 'sinatra/base'
require './lib/maker.rb'

class Chitter < Sinatra::Base

  get '/' do
    @maker = Maker.all
    redirect '/sign_up'    ## we be multiple routes and conditionals
    #shows list of peeps before you need to sign up. Goes to sign_up button
    #also cannot show add_peep until user has signed up and logged in - this button can only be viewed if user logged in.
    #use conditional here = if logged in, display logout button (and vise versa) --
    #may need another table (user logged in or out)
  end

  get '/sign_up' do
    erb :sign_up
    redirect '/login'
  end

  get '/login' do
   erb :login
   redirect '/'
   #now shows all the features to add peep
  end

  get '/add_peep' do
    erb :add_peep
    redirect '/'
    #see peep
  end
end
