get '/' do
  @peeps = Peep.all
  erb :index
end

def get_peep_user(id)
  Maker.get(id).username
end
