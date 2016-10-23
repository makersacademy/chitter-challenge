class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/peeps' do
    erb(:'peeps')
  end

  get '/peeps/new' do
    if current_user
      erb(:'peeps/new')
    else
      flash.keep[:errors] = ["You need to be logged in to post a peep"]
      redirect '/sessions/new'
    end
  end

  post '/peeps' do
    time = Time.now
    peep_content = Peep.new_line(params[:content])
    current_user.peeps << Peep.create(content: peep_content,
                                      created_at: time)
    current_user.save
    redirect '/peeps'
  end
end
