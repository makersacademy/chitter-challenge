feature 'Viewing peeps' do

  scenario 'I can see peeps on the home page' do
    Peep.create(name: 'My Name', username: 'My Username', text: 'Testing')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Testing')
    end
  end
end

feature 'Creating peeps' do
  scenario 'I can create a peep' do
    visit '/peeps'
    click_button('New Peep')
    fill_in :name, with: 'My Name'
    fill_in :username, with: 'My Username'
    fill_in :text, with: 'Testing Again'
    fill_in :time, with: 'Now'
    click_button('Post Peep')
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Testing Again')
    end
  end
end

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, barry@example.com')
    expect(User.first.email).to eq('barry@example.com')
  end
end

feature 'User sign up' do

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  # def sign_up(email: 'barry@example.com',
  #             password: '12345678',
  #             password_confirmation: '12345678')
  #   visit '/users/new'
  #   fill_in :email, with: email
  #   fill_in :password, with: password
  #   fill_in :password_confirmation, with: password_confirmation
  #   click_button 'Sign up'
  # end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end

feature 'User sign in' do

  let(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  # def sign_in(email:, password:)
  #   visit '/sessions/new'
  #   fill_in :email, with: email
  #   fill_in :password, with: password
  #   click_button 'Sign in'
  # end

end




describe User do

  let!(:user) do
    User.create(email: 'test@test.com', password: 'secret1234',
               password_confirmation: 'secret1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
  expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
end

end

feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
