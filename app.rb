require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  # THIS CODE IS FOR THE FIRST STEP OF THE PROYECT, CREATE THE SIMPLIEST
  # MESSAGE POSSIBLE.
  # ---------------------
  # get '/' do
  #   "This is Chitter, your instant message service!"
  # end
  # ----------------------

  get '/' do
    # now the message is delivered in the erb file. index.erb
    # "This is Chitter, your instant message service!"
    erb :index
  end

  post '/peeps/new' do
    # now the peep is stored in a session param when the form is filled
    # with the peep.
    # session[:peep] = params[:peep] , now this is not neccesary, as long there
    # is table in the database with the data.
    redirect '/peeps'
  end

  get '/peeps' do
    # At this point i am refactoring to be able to show several peeps.
    # To do that i am gonna create a new variable to one single peep and
    # another variable to call the method which show me all the peeps.
    # @single_peep = session[:peep] , not neccesary anymore. Database in charge.
    @peeps = Peep.posted_peeps
    erb :peeps
    # Since this step the database and posted_peeps method insert the peep in
    # the database and the table. So at the moment only the instance variable
    # is necessary.
  end

  run! if app_file == $0

end
