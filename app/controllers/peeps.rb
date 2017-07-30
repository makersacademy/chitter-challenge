class Chitter < Sinatra::Base

  get '/peeps/new' do
    @user = current_user
    erb :'/peeps/new'
  end

  get '/peeps/view-all' do
    @user = current_user
    @peeps = Peep.all
    erb :'/peeps/view-all'
  end

  post '/peeps' do
    peep = Peep.new(message: params[:message], user: current_user)
    peep.save
    user_id = peep.user_id
    p user_id
    redirect '/peeps/view-all'
  end

end
