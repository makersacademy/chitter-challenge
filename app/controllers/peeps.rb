class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    current_user.peeps.create(message: params[:message])
    redirect('/peeps')
  end

end
