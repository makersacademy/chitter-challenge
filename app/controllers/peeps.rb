class Chitter < Sinatra::Base
  get '/peeps', :auth => true do
    @peeps = current_user.peeps
    erb :'peeps/index'
  end

  post '/peeps', :auth => true do
    current_user.peeps.create(message: params[:message])
    redirect '/peeps'
  end
end
