require_relative '../factories/user'

feature 'User Features' do
  let(:user){ create :user }

  scenario 'can sign up' do
    user = build :user
    sign_up(user)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  scenario 'can sign in' do
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  scenario 'can sign out' do
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content "Welcome, #{user.email}"
  end

  context 'when signing up' do
    scenario 'password confirmation must match password' do
      user.password_confirmation = 'wrong'
      sign_up(user)
      expect(page).to have_content 'Password does not match the confirmation'
    end

    scenario 'name is required' do
      user.name = nil
      sign_up(user)
      expect(page).to have_content 'Name must not be blank'
    end

    scenario 'username is required' do
      user.username = nil
      sign_up(user)
      expect(page).to have_content 'Username must not be blank'
    end

    scenario 'email is required' do
      user.email = nil
      sign_up(user)
      expect(page).to have_content 'Email must not be blank'
    end

    scenario 'email must be unique' do
      visit '/users/new'
      sign_up(user)
      expect(page).to have_content 'Email is already taken'
    end

    scenario 'username must be unique' do
      visit '/users/new'
      sign_up(user)
      expect(page).to have_content 'Username is already taken'
    end
  end

  context 'when signing in' do
    scenario 'password must be correct' do
      user.password = 'wrong'
      sign_in(user)
      expect(page).to have_content 'The email or password is incorrect'
    end

    scenario 'email must be correct' do
      user.email = 'wrong@email.com'
      sign_in(user)
      expect(page).to have_content 'The email or password is incorrect'
    end
  end
end
