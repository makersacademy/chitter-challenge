class Chitter < Sinatra::Base
  post '/peeps' do
    time = Time.now
    peep = Peep.create(post: params[:peep], time: time.strftime('%H:%M:%S'), user: User.get(session[:user_id]))
    peep.save
    redirect to('/home')
  end
end
