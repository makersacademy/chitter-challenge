class Chitter < Sinatra::Base

  get '/' do
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(content: params[:content])
    if current_user.nil?
      flash.next[:errors] = ['You must sign in to post a peep']
      redirect '/peeps/new'
    else
      peep.user_id = current_user.id
      peep.save
      redirect '/peeps'
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
end
