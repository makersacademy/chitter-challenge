# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

describe 'Sign up' do

  scenario 'user can create account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq 'john.smith@yournamedomain.co.uk'
  end

  scenario 'user must use an email address for signup' do
    visit '/signup'
<<<<<<< HEAD
    fill_in :name, with: 'Jose'
    fill_in :username, with: 'jc85'
=======
>>>>>>> 030ed49... flash error messages added for incorrect user signup
    fill_in :email, with: nil
    fill_in :password, with: 'football'
    fill_in :password_confirmation, with: 'football'
    expect { click_button 'Create account' }.not_to change(User, :count)
  end

  scenario 'user must provide a valid email address' do
    visit '/signup'
<<<<<<< HEAD
    fill_in :name, with: 'Tony'
    fill_in :username, with: 'ninja'
=======
>>>>>>> 030ed49... flash error messages added for incorrect user signup
    fill_in :email, with: 'tony@something'
    fill_in :password, with: 'football'
    fill_in :password_confirmation, with: 'football'
    expect { click_button 'Create account' }.not_to change(User, :count)
  end

  scenario 'prevent signup with existing email address' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end

  scenario 'prevent signup when passwords do not match' do
    visit '/signup'
    fill_in 'email', with: 'john.smith@yournamedomain.co.uk'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: 'wrong'

    expect { click_button 'Create account' }.not_to change(User, :count)
    expect(page).to have_content 'Password does not match the confirmation'
    # expect(current_path).to eq('/signup') # current_path is a helper provided by Capybara
  end

<<<<<<< HEAD
  describe 'Sign-in' do

    scenario 'user can sign into Chitter' do
      visit '/'
      expect(page.status_code).to eq 200
      expect(page).to have_content('Sign in')
    end

    let!(:user) do
      User.create(name: 'Example', username: 'eg1', email: 'example@domain.com', password: 'apples5',
                 password_confirmation: 'apples5')
    end

    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.email, 'oranges10')).to be_nil
    end

  end

  describe 'Sign out' do

    # before(:each) do
    #   user = User.create(name: 'Example', username: 'eg1', email: 'example_one@domain.com', password: 'apples5',
    #              password_confirmation: 'apples5')
    # end

    scenario 'user can sign out' do
      sign_up
      visit '/peeps'
      click_button 'Sign out'
      expect(page).to have_content('Hasta luego')
      expect(page).not_to have_content('Welcome')
    end

  end

=======
>>>>>>> 030ed49... flash error messages added for incorrect user signup
end
