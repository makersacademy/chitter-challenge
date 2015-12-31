class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(user: current_user, content: params[:content])
    if peep.save
      redirect '/peeps'
    else
      flash.now[:errors] = peep.errors.full_messages
      erb :'/peeps/new'
    end
  end
end
