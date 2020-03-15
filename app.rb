require 'sinatra/base'

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
    session[:peep] = params[:peep]
    redirect '/peeps'
  end

  get '/peeps' do
    # what we see now in peeps is the message, storaged in the session param,
    # i call that value and pass it to to the view in peeps.erb, which is
    # referenced in the line below (erb :peeps)
    @peeps = session[:peep]
    erb :peeps
  end

run! if app_file == $0

end
