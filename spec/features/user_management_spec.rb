feature 'User sign up' do

  scenario 'new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Barney')
    expect(User.first.email).to eq 'barney@barney.com'
  end

  scenario 'matching password confirmation is required' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'confirmation password doesnt match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'email address field is mandatory' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'email address must have valid format' do
    expect { sign_up(email: 'not@valid') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'existing email cannot register' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end

feature 'User sign in' do

  let!(:user) do
    User.create(username: 'Lucia',
                email: 'lucia@lucia.com',
                password: 'pass1234',
                password_confirmation: 'pass1234')
  end

  scenario 'I can sign in' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'I cant sign in with incorrect password' do
    sign_in(email: user.email, password: 'wrong_justwrong')
    expect(page).to have_content 'The email or password is incorrect'
  end
end

feature 'User sign out' do

  before(:each) do
    User.create(username: 'Lucia4',
                email: 'lucia@labrador.com',
                password: 'pass1234',
                password_confirmation: 'pass1234')
  end

  scenario 'successful sign-out' do
    sign_in(email: 'lucia@labrador.com', password: 'pass1234')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye, see you soon!')
    expect(page).not_to have_content('Welcome, Lucia4')
  end
end
