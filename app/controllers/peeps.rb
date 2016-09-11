class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    current_user.peeps.create(message: params[:message], time_created: Time.now)
    redirect '/'
  end
end
