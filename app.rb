require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base

# sign-up - if username exists, then return to sign-up page + display error
# - draw databases, user and password
# takes user back to sign up page if logged out and try to access any other page
# sign page has 2 forms, one for login, one for sign-up.

# users can only sign in with a password, set at sign up


  get '/' do
    erb(:index)
  end

  get '/peeps/new' do
    erb(:peeps_new)
  end

  post '/peeps' do
    Peep.add(params[:peep_content], Time.now.strftime("%I:%M %p"), User.current_user_id)
    redirect('/peeps')
  end

  get '/peeps' do
    @peep = Peep.all.reverse
    erb(:peeps)
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/sign-up' do
    # redirect('/sign-up') if User.exists?(params[:username])
    User.add(params[:username])
    User.change_current_user_name(params[:username])
    User.change_current_user_id(User.get_user_id(params[:username]))
    redirect('/')
  end

end
