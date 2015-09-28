feature 'User sign up' do
	
	scenario 'I can sign up as a new user' do
		user = build(:user)
		expect { sign_up_as(user) }.to change(User, :count).by(1)
		expect(page).to have_content('Welcome, alice@example.com')
		expect(User.first.email).to eq('alice@example.com')
	end

	scenario 'requires a matching confirmation password' do
		user = build(:user, password_confirmation: 'wrong')
		expect { sign_up_as(user) }.not_to change(User, :count)
		expect(current_path).to eq('/users')
		expect(page).to have_content 'Password does not match the confirmation'
	end

	scenario 'will fail if user does not enter an email' do
		user = build(:user, email: '')
		expect { sign_up_as(user) }.not_to change(User, :count)
		expect(current_path).to eq('/users')
		expect(page).to have_content 'Email must not be blank'
	end

	scenario 'I cannot sign up with an existing email' do
		user = build(:user)
		sign_up_as(user)
		expect { sign_up_as(user) }.to change(User, :count).by(0)
		expect(page).to have_content('Email is already taken')
	end

	def sign_up_as(user)
		visit '/users/new'
		fill_in :email, with: user.email
		fill_in :password, with: user.password
		fill_in :password_confirmation, with: user.password_confirmation
		click_button 'Sign up'
	end
end

feature 'User sign in' do
	
	let(:user) do
		User.create(email: 'user@example.com',
								password: 'secret1234',
								password_confirmation: 'secret1234')
	end

	scenario 'with correct credentials' do
		sign_in(email: user.email, password: user.password)
		expect(page).to have_content "Welcome, #{user.email}"
	end

	def sign_in(email:, password:)
		visit '/sessions/new'
		fill_in :email, with: user.email
		fill_in :password, with: user.password
		click_button 'Sign in'
	end
end

feature 'User sign out' do

	before(:each) do
		User.create(email: 'test@test.com',
								password: 'test',
								password_confirmation: 'test')
	end

	scenario 'while being signed in' do
		sign_in(email: 'test@test.com', password: 'test')
		click_button 'Sign out'
		expect(page).to have_content('Goodbye!')
		expect(page).not_to have_content('Welcome, test@test.com')
	end

	def sign_in(email:, password:)
		visit '/sessions/new'
		fill_in :email, with: user.email
		fill_in :password, with: user.password
		click_button 'Sign in'
	end
end





