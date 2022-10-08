require 'sinatra'
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader 
    also_reload ''
    also_reload ''
  end

    # Homepage
  get '/' do
    return erb(:homepage)
  end

  #Signup page
  get '/signup' do
    return erb(:signup)
  end

  # Successfully signed up -> link to home page
  post '/signup' do
    if invalid_request_signup?
      status 400
      return ''
    end

    repo = UserRepository.new
    new_user.id = params[:id]
    new_user.username = params[:username]
    new_user.password = params[:password]
    repo.create(new_user)
    return erb(:signup_success)
      #(see if i can redirect page automatically to homepage)
  end

  get '/newpeep' do
    return # page for new peeps(messages) - see if i can make it popup on the same page instead
  end

  post '/newpeep' do
    return # New peep added -> see if i can redirect back to home page 
  end
end

private 

# Error Status methods
def invalid_request_signup?
  params[:username] == nil || params[:password] == nil
end

def invalid_request_peep?
  params[:content] == nil
end