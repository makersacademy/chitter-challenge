require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/registration'
require_relative './lib/user'
require_relative './lib/peeps'


class Chitter < Sinatra::Base

register Sinatra::Flash

  enable :sessions

  get '/' do
    erb :main_web
  end

  get '/registration' do
    erb :registration
  end

  post '/registration_details' do
    Registration.register(email: params[:email], password: params[:password])
    redirect('/registration/complete')
  end

  get '/registration/complete' do
    erb :registration_complete
  end

  post '/log_in' do
    user = User.password_check(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/chitter')
    else
      redirect('/')
    end
  end

  get '/chitter' do
    @user = User.find(id: session[:user_id])
    erb :chitter
  end

  post '/peeps' do
    User.insert_peeps(peeps: params[:peeps])
    redirect('/chitter')
  end

  get '/all_posts' do
    @user = User.find(id: session[:user_id])
    @peeps = Peeps.all
    erb :all_posts
  end

delete 'peeps/:id' do
  Peeps.delete(id: params[:id])
  redirect('/all_posts')
end




  run! if app_file == $0
end
