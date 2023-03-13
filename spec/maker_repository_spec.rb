require 'maker'
require_relative '../lib/maker_repository'

describe MakerRepository do

  def reset_makers_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_makers_table
  end

  after(:all) do
    reset_makers_table
  end

  it 'gets all makers' do

    repo = MakerRepository.new

    makers = repo.all

    expect(makers.length).to eq  2

    expect(makers[0].id).to eq  1
    expect(makers[0].name).to eq  'Jim Slick'
    expect(makers[0].username).to eq 'Jimbo'
    expect(makers[0].email_address).to eq 'jimbo94@makersacademy.com'
    expect(makers[0].password).to eq  'password123'

    expect(makers[1].id).to eq  2
    expect(makers[1].name).to eq  'Flash Gordon'
    expect(makers[1].username).to eq 'Flash'
    expect(makers[1].email_address).to eq 'flashgordon@makersacademy.com'
    expect(makers[1].password).to eq  'password789'

  end

  it 'creates a new maker' do
    repo = MakerRepository.new

    maker = Maker.new
    maker.name = 'Hans Gruber'
    maker.username = 'Bruce'
    maker.email_address = 'hans_the_mans@makersacademy.com'
    maker.password = 'Nakat0miPlaza'
    repo.create(maker)
    
    makers = repo.all
    
    expect(makers.last.id).to eq 3
    expect(makers.last.name).to eq 'Hans Gruber'
    expect(makers.last.username).to eq 'Bruce'
    expect(makers.last.email_address).to eq 'hans_the_mans@makersacademy.com'
    expect(makers.last.password).to eq 'Nakat0miPlaza'
  end
end