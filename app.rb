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
    Peep.add(params[:peep_content], Time.now.strftime("%I:%M %p"), User.current)
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
    User.change(params[:username])
    redirect('/')
  end

end
