require_relative '../models/peep'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all.sort_by(&:created_at).reverse! 
    erb :'peeps/index'
  end

  post '/peeps/new' do
    @user.peeps.create(peep_params)
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(params[:id])
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    peep = Peep.find(params[:id])
    peep.update(peep_params)
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    peep = Peep.find(params[:id])
    peep.destroy
    redirect '/peeps'
  end

  private

  def peep_params
    { body: params[:body] }
  end
end
