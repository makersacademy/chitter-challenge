require 'timecop'
require 'peep_repository'

describe PeepRepository do

  def reset_peeps_table
    seed_sql = File.read('spec/seeds_makers.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_peeps_table
  end

it 'list all peeps' do

  repo = PeepRepository.new

  post = repo.all

  expect(post.length).to eq 2

  expect(post[0].id).to eq '1'
  expect(post[0].peep).to eq 'first peep'
  expect(post[0].time).to eq '2022-11-11 11:11:11'
  expect(post[0].maker_id).to eq '1'

  expect(post[1].id).to eq '2'
  expect(post[1].peep).to eq 'second peep'
  expect(post[1].time).to eq '2022-12-12 12:12:12'
  expect(post[1].maker_id).to eq '1'

end

it 'finds a single peep' do

  repo = PeepRepository.new

  post = repo.find(1)

  expect(post.id).to eq '1'
  expect(post.peep).to eq 'first peep'
  expect(post.time).to eq '2022-11-11 11:11:11'
  expect(post.maker_id).to eq '1'
end

it 'creates a new peep' do
  repo = PeepRepository.new
  new_post = Peep.new
  time = DateTime.now
  time_string = time.strftime("%Y-%m-%d %H:%M:%S")

  total_before = repo.all

  Timecop.freeze(time) do
  new_post.id = '3'
  new_post.peep = 'third peep'
  new_post.maker_id = '1'

  repo.create(new_post)

  posts = repo.all

  expect(posts).to include(
    have_attributes(
      id: new_post.id,
      peep: new_post.peep,
      maker_id: new_post.maker_id,
      time: time_string,
      )
    ) # => returns an array including the new object

    expect(posts.length).to eq(total_before.length+1)
    end
  end
end