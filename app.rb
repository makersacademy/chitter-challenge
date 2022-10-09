require 'sinatra/base'
require_relative 'lib/datbase_connection'
require 'sinatra/reloader'

require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/user'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
    #allows app code to refresh confirmed by TQ on Discord

    configure :development do
        register Sinatra::reloader
        also_reload 'lib/peep_repository'
        also_reload 'lib/user_repository'
    end

    enable :sessions

    get '/peeps' do
        repo = PeepRepository.new
        @peeps = repo.all.sort_by(&:date).reverse
        erb(:peeps)
    end

    post '/peeps' do
        if session[user_id].nil?
            @peep = Peep.new
            @peep.content = params[:content]
            @peep.date = Time.now
            @peep.user_id = '1'
            repo = PeepRepository.new
            repo.add(@peep)
        else
            @peep = Peep.new
            @peep.content = params[:content]
            @peep.date = Time.now
            @peep.user_id = session[:user_id]
            repo = PeepRepository.new
            repo.add(@peep)
        end
        redirect '/peeps'
    end
    get '/post' do
        erb(:post)
      end
    
      get '/sign-up' do
        erb(:sign_up)
      end
    
      post '/users' do
        @user = User.new
        @user.name = params[:name]
        @user.username = params[:username]
        @user.email = params[:email]
        @user.password = params[:password]
        repo = UserRepository.new
        repo.create(@user)
      end
    
      get '/sign-in' do
        erb(:sign_in)
      end
    
      post '/sign-in' do
        repo = UserRepository.new
        user = repo.find_by_email(params[:email])
    
        if repo.sign_in(params[:email], params[:password]) == true    
          session[:user_id] = user.id
          return erb(:sign_in_success)
        else
          return erb(:sign_in_error)
        end
    end
end