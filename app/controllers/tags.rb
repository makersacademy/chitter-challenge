require 'sinatra/base'
require 'sinatra/flash'
require_relative '../models/peep'
require_relative '../models/user'
require_relative '../models/tag'
require_relative '../models/reply'

class Chitter < Sinatra::Base

  get '/tags/:tag' do
    tag = Tag.first(name: params[:tag])
    @peeps = tag ? tag.peeps : []
    erb :'/peeps/index'
  end

end
