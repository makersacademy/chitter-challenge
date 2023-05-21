require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './lib/peeps_repository'
require './lib/user_repository'
require './lib/peeps'

class PeepsController < Sinatra::Base
  configure do
    set :views, File.join(__dir__, '..', 'views')
    set :public_dir, File.join(__dir__, '..', 'public')
  end

  before do
    @user_repo = UserRepository.new
    @peeps_repo = PeepsRepository.new(@user_repo)
  end

  get '/peeps' do
    @peeps = @peeps_repo.all
    erb :peeps
  end

  get '/peeps/:id' do
    user_id = params[:id]
    @peeps = @peeps_repo.find(user_id)

    if @peeps.nil?
      erb :no_user_peeps
    else
      erb :user_peeps
    end
  end

  post '/peeps/:id/delete' do
    peep_id = params[:id]
    @peeps_repo.delete(peep_id)
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    peep_id = params[:id]
    @peep = @peeps_repo.find(peep_id)
    erb :edit_peep, locals: { peep: @peep }
  end

  post '/peeps/:id' do
    peep_id = params[:id]
    new_content = params[:peep_content]
    @peep = @peeps_repo.find(peep_id)

    if @peep
      @peep.peep_content = new_content
      @peeps_repo.update(@peep)
      redirect '/peeps'
    else
      erb :peeps, locals: { error: "Peep not found." }
    end
  end

  post '/peep' do
    peep_content = params[:peep_content]

    if peep_content.nil? || peep_content.empty?
      erb :peep, locals: { error: "Please enter a peep message." }
    else
      new_peep = Peep.new(
        id: params[:id],
        peep_content: peep_content,
        user_id: session[:user_id],
        time_of_peep: Time.now,
        username: params[:username]
      )

      @peeps_repo.create(new_peep)

      redirect '/peeps'
    end
  end
end
