class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    current_user = @current_user
    erb :'/peeps/new'
  end

  post '/peeps/new' do
    Peep.create(content: params[:content], time: Time.now)
    redirect '/peeps'
  end

end
