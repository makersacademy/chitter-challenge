require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'lib/database_connection'

require_relative 'lib/peeps_repository'
require_relative 'lib/accounts_repository'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
    enable :sessions

    # This allows the app code to refresh
    # without having to restart the server.
    configure :development do
        register Sinatra::Reloader
        also_reload 'lib/peeps_repository'
        also_reload 'lib/accounts_repository'
    end

    # repos
    pe_re = PeepsRepository.new
    ac_re = AccountsRepository.new

    # get routes
    get '/' do
        @current_user = ac_re.find(session[:current_user])
        # collect all peeps, display in reverse
        @peeps = pe_re.all.reverse!
        return erb(:index)
    end
    get '/peep/:id' do
        @current_user = ac_re.find(session[:current_user])
        # get specified peep
        @peep = pe_re.find(params[:id])
        return erb(:peep)
    end
    get '/login' do
        # login page
        @return_uri = params[:return]
        return erb(:login)
    end
    get '/logout' do
        # destroy session
        session[:current_user] = nil
        redirect '/'
    end
    get '/register' do
        # register
        return erb(:register)
    end
    get '/post' do
        @current_user = ac_re.find(session[:current_user])
        # show post page
        if(@current_user.nil?)
            redirect '/login?return=/post'
        else
            return erb(:post)
        end
    end

    # post routes
    post '/login' do
        # authenticate user
        auth = ac_re.authenticate(
            params[:email],
            params[:password]
        )
        if(auth == false)
            @login_error="Incorrect email or password."
            return erb(:login)
        else
            if(params[:return].nil? != true)
                session[:current_user] = auth
                redirect params[:return]
            else
                redirect "/"
            end
        end
    end
    post '/register' do
        # create account
        result = ac_re.create(params)
        if(result != false)
            session[:current_user] = result
            redirect "/"
        else
            @register_error = "The details you have entered are already being used.";
            return erb(:register)
        end
    end
    post '/post' do
        # post a message
        msg = params[:message]
        # msg will be sanitised in the repos
        pe_re.create(msg,session[:current_user])
        # redirect to index
        redirect "/"
    end
end