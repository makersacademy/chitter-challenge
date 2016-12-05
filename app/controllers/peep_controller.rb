class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content], :user => current_user)
    redirect '/peeps'
  end

end
