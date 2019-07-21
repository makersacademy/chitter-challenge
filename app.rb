require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/squiggle'
require_relative 'lib/user'
require_relative 'lib/tag'
require_relative 'lib/squiggles_tag'

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

  post '/squiggles/:id/tag' do
    nuttags = params['nuttag']
    nuttags.split(",").map do |nuttag|
      nuttag.strip!
      nuttag = nuttag.delete('#')
      tag = Tag.create(nuttag)
      SquiggleTag.create(params['id'], tag.id)
    end
    redirect('/squiggles')
  end

  get '/tags' do
    nuttag = params['tag_search']
    nuttag = nuttag.delete('#')
    squiggle_id_array = Tag.squiggles_tagged(nuttag)
    @squiggles = squiggle_id_array.uniq.map { |id|
      Squiggle.find(id)
    }
    erb :tags

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
