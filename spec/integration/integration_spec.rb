require 'user_repository'
require 'peep_repository'
require 'peep_model'
require 'user_model'

def reset_peeps_table
    seed_sql = File.read('spec/seeds_peeps_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitterdb_test' })
    connection.exec(seed_sql)
end

RSpec.describe "integration" do
  before(:each) do 
    reset_peeps_table
  end

  it 'Creates a user and two peeps.' do
    user_repo = UserRepository.new
    peep_repo = PeepRepository.new
    new_user = User.new
    new_user.first_name = 'Jane'
    new_user.last_name = 'Dough'
    new_user.user_name = 'janedough'
    new_user.user_email = 'janedough@peep.com'
    user_repo.create(new_user)

    first_new_peep = Peep.new
    first_new_peep.peep_content = 'This is my first peep!'
    first_new_peep.peep_post_date = '2023-03-15'
    peep_repo.create(first_new_peep)

    second_new_peep = Peep.new
    second_new_peep.peep_content = 'This is my second peep!'
    second_new_peep.peep_post_date = '2023-03-15'
    peep_repo.create(second_new_peep)

    peep_repo.delete_peep(first_new_peep.id)
    peeps = peep_repo.all

    expect(peeps.length).to eq 6
    expect(peeps[5].peep_content).to eq 'This is my second peep!'
    
    new_user.user_name = 'janesourdough'
    user_repo.update(new_user)
    expect(new_user.user_name).to eq 'janesourdough'
  end

  it 'Deletes all peeps for one user.' do
    user_repo = UserRepository.new
    peep_repo = PeepRepository.new
    new_user = User.new
    new_user.first_name = 'Jane'
    new_user.last_name = 'Dough'
    new_user.user_name = 'janedough'
    new_user.user_email = 'janedough@peep.com'
    user_repo.create(new_user)

    first_new_peep = Peep.new
    first_new_peep.peep_content = 'This is my first peep!'
    first_new_peep.peep_post_date = '2023-03-15'
    peep_repo.create(first_new_peep)

    second_new_peep = Peep.new
    second_new_peep.peep_content = 'This is my second peep!'
    second_new_peep.peep_post_date = '2023-03-15'
    peep_repo.create(second_new_peep)
    peeps = peep_repo.all
    peep_repo.delete_all_peeps(6)
    peeps_for_user = peep_repo.find_user_peeps(6)
    expect(peeps_for_user.length).to eq 0
  end
end