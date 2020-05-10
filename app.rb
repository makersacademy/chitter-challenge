require 'sinatra'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do 
    'testing'
  end 

  get '/peeps' do 
    @peeps = Peep.all
    @user = $user
    erb(:peeps)
  end

  post '/peeps' do 
    Peep.add(body: params['body'])
    redirect('/peeps')
  end

  get '/sign-up' do 
    erb :signup
  end

  post '/sign-up-details' do 
    User.sign_up(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    redirect('/confirm-sign-up')
  end

  get '/confirm-sign-up' do 
    @user = User.last
    erb :confirm_signup
  end

end