require 'sinatra/flash'
class SessionsController < Sinatra::Base
  set :views, './views'
  register Sinatra::Flash

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    maker = Maker.authenticate(
      email: params[:email],
      password: params[:password]
    )
    if maker
      session[:maker_id] = maker.id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/peeps')
  end
  
end
