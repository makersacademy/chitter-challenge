require 'sinatra/base'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    @peeplist = Peeps.view
    erb :index
  end

  post '/' do
    if params['post-peep'] == "Post Peep"
      @user_id = $user_id
      Peeps.add(peep_text: params['peep-text'], peep_user_id: @user_id)
      redirect '/'
    end
    if params['log-in-or-register'] == "Register"
      redirect '/new-user'
    else
      redirect '/log-in'
    end
  end

  get '/log-out' do
    session[:logged_in] = false
    redirect '/'
  end

  get '/new-user' do
    erb :new_user
  end

  post '/new-user' do
    User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    session[:logged_in] = User.log_in(username: params['username'], password: params['password'])
    $user_id = User.get_user_id(username: params['username'])
    redirect '/'
  end

  get '/log-in' do
    erb :log_in
  end

  post '/log-in' do
    session[:logged_in] = User.log_in(username: params['username'], password: params['password'])
    if session[:logged_in] == true
      $user_id = User.get_user_id(username: params['username'])
      redirect '/'
    elsif session[:logged_in] == false
      redirect '/log-in'
    end
  end

  run! if app_file == $0
end
