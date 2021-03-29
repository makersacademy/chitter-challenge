require './app.rb'
require 'web_helper.rb'
require 'pg'

feature 'index' do
	scenario 'page exists' do
		visit '/'
		expect(page).to have_content("Chitter")
	end
end

feature 'Log in' do
	scenario 'page exists' do
		visit '/'
		click_button('Log in')
		expect(current_path).to eq '/login'
	end

	scenario 'is possible' do
		visit '/login'
		sign_in #see web_helper.rb if unsure what this does.
		click_button('Submit')
	end
end

feature 'Sign Up' do
	scenario 'page exists' do
		visit '/'
		click_button('Sign up')
		expect(current_path).to eq '/signup'
	end

	scenario 'is possible' do
		visit '/signup'
		sign_up #see web_helper.rb if unsure what this does.
		click_button('Submit')
	end

	scenario 'creates a new account' do
		visit '/signup'
		sign_up #see web_helper.rb if unsure what this does.
		click_button('Submit')
		connection = PG.connect(dbname: 'chitter_test') #connecting to the database 'chitter_test'
		test_user = connection.exec("SELECT * FROM users WHERE username='test_username';") #searching within the database
		expect(test_user.last_name).to eq('test_lastname')
		expect(test_user.first_name).to eq('test_firstname')
		expect(test_user.date_of_birth).to eq('21/03/2006')
		expect(test_user.email).to eq('test.email@test.com')
		expect(test_user.username).to eq('test_username')
		expect(test_user.password).to eq('test_password')
	end
end