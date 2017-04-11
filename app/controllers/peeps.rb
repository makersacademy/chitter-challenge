class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(content: params[:content],
                       user_id: current_user.id)
    peep.save
    redirect to('/')
  end

end
