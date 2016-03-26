class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(order: [:id.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(content: params[:content],
                    time: DateTime.now)
    if current_user
      current_user.peeps << peep
      can_save peep
    else
      flash.now[:errors] = ['You must be logged in to peep!']
      erb :'peeps/new'
    end
  end

  get '/peeps/me' do
    @peeps = Peep.all(user_id: current_user.id, order: [:id.desc])
    erb :'peeps/index'
  end
end
