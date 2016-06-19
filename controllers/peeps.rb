class Chitter < Sinatra::Base
  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(content: params[:content], created_at: Time.new)
    current_user.peeps << peep
    current_user.save
    redirect '/'
  end

end
