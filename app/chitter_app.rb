
require_relative '../lib/peeps'
require_relative '../lib/users'

require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
    register Sinatra::Flash
    enable :sessions, :method_override

    get('/') do
      redirect('/home')
    end

    get('/home') do
      erb :sign_in
    end

    post ('/sign_in') do
      Users.start_connection
      current_user = Users.access_account(params[:username],params[:password])
      if current_user == false
        flash[:warning] = "Incorrect Username or Password"
        redirect ('/')
      else
        Peeps.sign_in(current_user)
        session[:id] = id=current_user.id
        redirect ('/peeps')
      end
    end

    get ('/sign_up') do
      erb :sign_up
    end

    post ('/account_creation') do
      Users.start_connection
      Users.add(
        username: params[:username],
        password: params[:password],
        age: params[:age],
        gender: params[:gender],)
      redirect ('/')
    end

    post ('/add_peep') do
      Peeps.add_peep(params[:peep],session[:id])
      redirect ('/peeps')
    end

    get('/profile') do
      @current_user = Users.get_user(session[:id])
      @current_photo = Users.get_photo(session[:id])
      @peeps = Peeps.view_by_user(session[:id])
      erb :profile
    end

    get('/peeps') do
      @current_user = Users.get_user(session[:id])
      @current_photo = Users.get_photo(session[:id])
      @peeps = Peeps.view_all
      erb :index
    end

    patch '/peeps/loves/:id' do
      Peeps.loveit(params[:id])
      redirect ('/peeps')
    end

    patch '/update/:id' do
      Users.update_photo(params[:id])
      redirect ('/profile')
    end

    patch '/peeps/hates/:id' do
      Peeps.hateit(params[:id])
      redirect ('/peeps')
    end
end
