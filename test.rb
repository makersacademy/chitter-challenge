require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require 'sinatra/base'
require 'sinatra/reloader'

DatabaseConnection.connect('chitter_database_test')

user = UserRepository.new
    p user.find_by_email('anna@makersacademy.com')

   p anna =  user.find_by_email('anna@makersacademy.com')
p anna.name
p anna.email
p anna.username
p anna.password
    p user.sign_in('avdvna@makersacademy.com', '235346hgsdv').name
    # if users.sign_in(params[:email], params[:password]).empty? == nil
    #   return erb(:login_error)
    
    # else
    #   session[:user_id] = user.id
    #   return erb(:all_peeps)
    # end


