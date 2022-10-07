require 'spec_helper'
require 'rack/test'
require_relative '../../app'

RSpec.describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /' do
    it 'returns the homepage in HTML with links to feed & compose' do
      @response = get('/')

      ok
      copy_test('<h1>Welcome To Chitter</h1>')
      copy_test("<a href='peeps'> See all peeps </a>")
      copy_test("<a href='peeps/new'> Compose a peep </a>")
    end
  end

  context 'GET /peeps' do
    it 'should return a list of peeps in HTML' do
      @response = get('/peeps')

      ok
      copy_test('<h1>Chitter Feed</h1>')
      copy_test('First peep babeh!')
      copy_test('Just started at makers')
    end

    it 'should include the time the peep was sent' do
      @response = get('/peeps')

      ok
      copy_test('<h1>Chitter Feed</h1>')
      copy_test('First peep babeh!')
      copy_test('Just started at makers')
      copy_test('2022-09-12 09:15:00')
    end

    it 'should show peeps in reverse chronological order' do
      @response = get('/peeps')

      ok
      copy_test('<h1>Chitter Feed</h1>')
      copy_test('First peep babeh!')
      copy_test('Just started at makers')
      copy_test('2022-09-12 09:15:00')
    end

    it 'should include the peep author' do
      @response = get('/peeps')

      ok
      copy_test('<h1>Chitter Feed</h1>')
      copy_test('Just started at makers')
      copy_test('2022-09-12 09:15:00')
      copy_test('@bennyboy')
    end
  end

  context "POST /peeps" do
    it "should add a new peep to the feed" do
      response = post('/peeps', content: 'Hello world', time: '2022-10-06 18:00:00', user_id: 1)

      expect(response.status).to eq(200)  #<----- why won't this shorten???!
      expect(response.body).to eq('')

      response = get('/peeps')
      expect(response.body).to include('Hello')
    end
  end

  context "GET /peeps/new" do
    it "returns an html form to add a new peep" do
      response = get('/peeps/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/peeps">')
      expect(response.body).to include('<input type="text" name="content" />')
      expect(response.body).to include('<select name="user_id">')
    end
  end

  context "POST /users" do
    it "should add a new user to the database" do
      response = post('/users', first_name: 'David', last_name: 'Beckham', username: 'db7', email: 'bendit@db7.com', password: 'benditin')

      expect(response.status).to eq(200)
      expect(response.body).to eq('')

      response = get('/users')
      expect(response.body).to include('David')
    end
  end

  context 'GET /users' do
    it 'should return a list of users in HTML' do
      @response = get('/users')

      ok
      copy_test('<h1>User list</h1>')
      copy_test('Benedict')
      copy_test('Smith')
      copy_test('bennyboy')
      copy_test('ben@gmail.com')
    end
  end

  context "GET /users/new" do
    it "returns an html form to enter user details" do
      response = get('/users/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/users">')
      expect(response.body).to include('<input type="text" name="first_name" />')
      expect(response.body).to include('<input type="text" name="last_name" />')
      expect(response.body).to include('<input type="text" name="username" />')
      expect(response.body).to include('<input type="text" name="email" />')
      expect(response.body).to include('<input type="text" name="password" />')
    end
  end

  context "GET /login" do
    xit "returns an html form so you can log in" do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/peeps/new">')
      expect(response.body).to include('<input type="text" name="username" />')
      expect(response.body).to include('<input type="text" name="password" />')
    end
  end


  private

  def ok
    expect(@response.status).to eq(200)
  end

  def copy_test(text)
    expect(@response.body).to include(text)
  end

end

# RSpec.describe Application do

#   def initialize(io)
#     @io = io
#   end

#   before(:each) do 
#     reset_tables('spec/seeds_items.sql')
#     reset_tables('spec/seeds_orders.sql')
#   end 

#   describe "#welome_choices"
#   context "text on initialisation" do
#     it "puts list of actions a user can perform" do
#       @io = double :io
#       app = Application.new('shop_manager', @io, ItemRepository.new, OrderRepository.new)
#       welcome
#       options
#       app.print_welcome
#       app.print_options
#     end
#   end

#   describe "user selection" do
#     context "select 1" do
#       it "returns a list of shop items" do
#         @io = double :io
#         app = Application.new('shop_manager', @io, ItemRepository.new, OrderRepository.new)
#         welcome
#         options
#         gets("1")
#         puts("Here's a list of all shop items: \n")
#         puts("#1 Scrabble - Unit price: £14 - Quantity: 100")
#         puts("#2 Catan - Unit price: £20 - Quantity: 25")
#         app.run
#       end
#     end

#     context "select 3" do
#       it "returns a list of orders" do
#         @io = double :io
#         app = Application.new('shop_manager', @io, ItemRepository.new, OrderRepository.new)
#         welcome
#         options
#         gets("3")
#         puts("Here's a list of all orders: \n")
#         puts("#1 Order name: Stephen - Order date: 2022-09-29")
#         puts("#2 Order name: Alan - Order date: 2022-10-01")
#         app.run
#       end
#     end

#     context "select 2" do
#       it "allows user to create new list item" do
#         @io = double :io
#         app = Application.new('shop_manager', @io, ItemRepository.new, OrderRepository.new)
#         welcome
#         options
#         gets("2")
#         puts("Please enter an item name")
#         gets("Chess")
#         puts("Please enter the item's price")
#         gets("5")
#         puts("Please enter a quantity of items")
#         gets("300")
#         puts("\nNew item added: ")
#         puts("Chess - Unit price: £5 - Quantity: 300")
#         app.run
#       end
#     end

#     context "select 4" do
#       it "allows user to create a new order" do
#         @io = double :io
#         app = Application.new('shop_manager', @io, ItemRepository.new, OrderRepository.new)
#         welcome
#         options
#         gets("4")
#         puts("Please enter the customer's name")
#         gets("Margaret")
#         puts("Please enter the order date (YYYY-MM-DD)")
#         gets("2022-12-25")
#         puts("\nNew order added: ")
#         puts("New order: Customer name: Margaret - Date: 2022-12-25")
#         app.run
#       end
#     end
#   end
      
#   private

#   def reset_tables(table_name)
#     seed_sql = File.read(table_name)
#     connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager' })
#     connection.exec(seed_sql)
#   end

#   def welcome
#     puts("\nWelcome to the Game-azon management program!")
#   end

#   def options
#     puts("\nWhat do you want to do?")
#     puts("1 = list all shop items")
#     puts("2 = create a new item")
#     puts("3 = list all orders")
#     puts("4 = create a new order")
#     puts("9 = exit app\n\n")
#     puts("Enter:")
#   end

#   def puts(string)
#     expect(@io).to receive(:puts).with(string)
#   end

#   def gets(string)
#     expect(@io).to receive(:gets).and_return(string)
#   end
# end