require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base

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
    @suggested_username = params[:username]
    redirect('/sign-up/failed') if User.exists?(@suggested_username)
    User.add(@suggested_username)
    User.change_current_user_name(@suggested_username)
    User.change_current_user_id(User.get_user_id(@suggested_username))
    redirect('/')
  end

  get '/sign-up/failed' do
    erb(:sign_up_failed)
  end

end
