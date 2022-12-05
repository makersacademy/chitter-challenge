require "spec_helper"
require "rack/test"
require_relative '../../app'


def reset_peeps_table
	seed_sql = File.read('spec/peeps_seeds.sql')
	connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
	connection.exec(seed_sql)
end

describe Application do
	before(:each) do 
		reset_peeps_table
	end

	include Rack::Test::Methods

	let(:app) { Application.new }


	xcontext "/" do
		it 'displays a welcome message and links' do
			response = get('/')

			expect(response.status).to be(200)
    		expect(response.body).to include('<a href="/">Login</a>')
			expect(response.body).to include('<a href="/signup"> New to Chitter? Sign up today</a>')
		end
	end


	xcontext "GET /login" do
		it 'returns a html list of peeps' do
		end
	end

	xcontext "POST /login" do
		it'' do
		end
	end


	context "GET /user/:user" do
		it "returns all peeps from the user" do
			response = get('/user/user_01')

			expect(response.status).to be(200)
			expect(response.body).to eq ('Hello World - 2022/04/12 00:14:00')
		end
	end


	xcontext "POST /:user/peep" do
		it 'adds a peep to the database' do
		  post_response = post('/user_01/peep', comment: 'Wild nothing', time: (date = DateTime.now).strftime("%Y/%m/%d"))
		  expect(post_response.status).to be (200)
	
		  get_response = get('/user/user_01')
	
		  expect(get_response.status).to be(200)
		  expect(get_response.body).to eq ("Hello world, Wild nothing")
		end
	end
end