class Chitter < Sinatra::Base

  get '/sign_up' do
    @peeps = Peep.all(order: :id.desc)
    erb :'/users/new'
  end

  post '/users/new' do
    user = User.create(name: Sanitize.fragment(params[:name]),
                       username: Sanitize.fragment(params[:username]),
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect '/sign_up'
    end
  end

end
