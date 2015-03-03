class ChitterApp < Sinatra::Base

  post '/peeps' do
    peep = params["peep"]
    puts @current_user
    Peep.create(:peep => peep, :entry_time=> Time.now, :user_id => session[:user_id])
    redirect to('/peeps')
  end

  get'/peeps' do
    @peep = Peep.all(:order => [:entry_time.asc])
    erb :peeps
  end

end