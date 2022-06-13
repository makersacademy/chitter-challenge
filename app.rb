require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'


class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter Chatter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end 

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/peeps'
  end


  run! if app_file == $0
end




# USER STORIES:


# user story 1 (was 2 originally)
# As a maker
# So that I can see what others are saying  
# I want to see all peeps ////////\\\\\\\\\\\\\

# user story 1.5 
# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order ///////\\\\\\\\\\


# user story 2
# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter ///////\\\\\\\\\\


# user story 3
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# user story 4
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter


# FUNCTIONALITY: 

# 1. You don't have to be logged in to see the peeps.
# 2. Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
# 3. The username and email are unique.
# 4. Peeps (posts to chitter) have the name of the maker and their user handle.
# 5. Your README should indicate the technologies used, and give instructions on how to install and run the tests.


