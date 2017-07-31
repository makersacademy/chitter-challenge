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
    p Peep.all
    p User.all
    redirect '/peeps/view-all'
  end

end
