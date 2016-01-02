class Chitter < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash[:errors] = user.errors.full_messages
      flash[:email] = user.email
      redirect to('/users/new')
    end
  end
end
