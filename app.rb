require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require 'sinatra'
require 'sinatra/reloader'

DatabaseConnection.connect

class Chitter < Sinatra::Base
    enable :sessions

    configure :development do
        register Sinatra::Reloader
        #also_reload 'lib/peep_repository'
        #also_reload 'lib/user_repository'
    end

    get '/' do
        peeps_with_user_data = []
        get_peep_user_data(peeps_with_user_data)
        @feed = peeps_with_user_data.sort_by { |x| x.time_posted }.reverse
        
        return erb(:index)
    end

    get '/sign-up' do
        return erb(:sign_up)
    end

    post '/sign-up' do
        user = User.new
        user.email = params[:email]
        user.password = params[:password]
        user.name = params[:name]
        user.username = params[:username]
        status = UserRepository.new.create(user)
        return erb(:sign_up_email_exists) if status.nil?
        return erb(:sign_up_username_exists) unless status
        return erb(:sign_up_success)
    end

    get '/login' do
        return erb(:login)
    end

    post '/login' do
        email = params[:email]
        password = params[:password]

        user = UserRepository.new.find_by_email(email)

        if user.password == password
            session[:user_id] = user.id

            return erb(:login_success)
        else
            return erb(:login_error)
        end
    end
    
    def get_peep_user_data(empty_array)
        user_repo = UserRepository.new
        peeps = PeepRepository.new.all
        peeps.each do |record|
            peep_data = PeepUserData.new
            peep_data.id = record.id
            peep_data.time_posted = record.time_posted
            peep_data.content = record.content
            peep_data.user_id = record.user_id
            peep_data.user_name = user_repo.find(record.user_id).name
            peep_data.user_username = user_repo.find(record.user_id).username

            empty_array << peep_data
        end
    end
end

