require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/squiggle'
require_relative 'lib/user'

class Squiggler < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/sign_in'
  end

  get '/sign_in' do
    erb :sign_in
  end

  get '/squiggles' do
    @user = User.find(session[:user_id])
    @squiggles = Squiggle.all
    erb :"squiggles/index"
  end

  post '/squiggles/:id/new' do
    squiggle = Squiggle.create(user_id: params[:id], squiggle: params['squiggle'])
    redirect '/squiggles'
  end

  post '/squiggles/:id/delete' do
    Squiggle.delete(params['id'])
    redirect '/squiggles'
  end

  post '/users' do
    user = User.create(name: params['name'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect('/squiggles')
  end

  # get '/sessions/new' do
  #   erb :"sessions/new"
  # end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])

    if user
      session[:user_id] = user.id
      redirect('/squiggles')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sign_in')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end
end
