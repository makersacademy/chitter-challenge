
class UserController < Sinatra::Base

  set :views, Proc.new { File.join(File.dirname(__FILE__), '..', "views") }

  register Sinatra::Flash
  enable :sessions

  get '/users/new' do
    erb :"users/new"
  end
  
  post '/users' do
    user = User.create(
      email: params['email'], password: params['password'], 
      name: params['name'], user_name: params['user_name']
    )
    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Email or Username already in use!'
      redirect('/users/new')
    end
  end
  
end