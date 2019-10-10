require 'sinatra/base'
require_relative '../lib/peeps'

class Chitter < Sinatra::Base

    enable :sessions, :method_override

    get('/') do
      erb :sign_in
    end

    post ('/sign_in') do
      Peeps.sign_in(params[:username])
      redirect ('/peeps')
    end

    post ('/add_peep') do
      Peeps.add_peep(params[:peep])
      redirect ('/peeps')
    end

    get('/peeps') do
      @current_user = Peeps.username
      @peeps = Peeps.view_all
      erb :index
    end

    patch '/peeps/loves/:id' do
      Peeps.loveit(params[:id])
      redirect ('/peeps')
    end

    patch '/peeps/hates/:id' do
      Peeps.hateit(params[:id])
      redirect ('/peeps')
    end

end
