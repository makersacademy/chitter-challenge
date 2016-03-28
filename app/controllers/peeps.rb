class Chitter < Sinatra::Base

  get '/peeps/read' do
    @maker = current_maker
    erb :'peeps/read'
  end

  post '/peeps/new' do
    maker = Maker.get(session[:maker_id])
    maker.peeps.create(text: params[:text],
                       time: Time.now.strftime("%H:%M"),
                       date: Time.now.strftime("%d/%m/%y"))
    redirect '/peeps/read'
  end
end
