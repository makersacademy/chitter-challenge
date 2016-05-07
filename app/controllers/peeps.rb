class Chitter < Sinatra::Base
  get '/' do
  	@peeps = Peep.all.reverse
  	erb :'peeps/index'
  end

  post '/peeps' do
  	Peep.create(user: current_user, content: params[:content], time: Time.now)
  	redirect '/'
  end
end