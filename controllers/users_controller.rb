class UsersController < Sinatra::Base
  set :views, './views'

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    if Maker.user_uniq?(email: params[:email], name: params[:name])

      maker = Maker.create(
        email: params[:email],
        password: params[:password],
        name: params[:name]
      )
      session[:maker_id] = maker.id
      redirect('/peeps')
    else
      flash[:notice] = 'Username or email currently in use, please try again'
    end
  end
end
