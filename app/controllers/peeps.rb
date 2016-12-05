class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'/peeps/peeps'
  end

  post '/peeps/new' do
    peep = Peep.create(message: params[:new_peep])
    if peep.save
      flash[:notice] = "Thank you, your peep has been posted."
      redirect '/peeps'
    else
      flash[:notice] = "Your peep was not posted. Please try again."
      redirect '/peeps'
    end
  end

end
