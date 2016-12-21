class Chitter < Sinatra::Base
  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    if session[:user_id] != nil
      current_user.peeps << Peep.create(body: params[:peep], name: current_user.name, username: current_user.username)
      current_user.save
      @peep = Peep.all
      erb :show_peep
    else
      flash[:errors] = ['You are not logged in']
      redirect '/log_in/new'
    end

  end

  get '/all_peeps' do
    erb :show_all_peeps
  end
end
