class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    message = params[:message]
    username = current_user.username
    full_name = current_user.full_name
    Peep.create(username: username,
                full_name: full_name,
                message: message,
                created_at: Time.now)
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

end
