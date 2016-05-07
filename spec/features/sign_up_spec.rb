# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'signing up creates a new user' do
    complete_sign_up_form

    expect(current_path).to eq '/users/new'
    expect { click_button 'Sign Up' }.to change(User, :count).by 1
    expect(User.first.name).to eq 'Michael H'
    expect(User.first.email).to eq 'test@chitter.com'
    expect(User.first.handle).to eq 'mikeh91'
  end

  scenario 'signing up logs the new user in' do
    sign_up
    expect(current_path).to eq '/users/mikeh91'
    expect(page).to have_content 'Michael H'
  end

  scenario 'email must be a valid email' do
    expect { sign_up(email: 'invalid_email') }.not_to change(User, :count)
    expect(current_path).to eq '/users/new'
  end

  scenario 'user must validate password' do
    expect { sign_up(confirm_password:'different') }.not_to change(User, :count)
    expect(current_path).to eq '/users/new'
    # expect(page).to have_content('Passwords don\'t match')
  end

  scenario 'handle must be unique' do
    sign_up
    expect { sign_up(email:'different@email.com') }.not_to change(User, :count)
    expect(current_path).to eq '/users/new'
    # expect(page).to have_content('Handle is taken')
  end

  scenario 'email must be unique' do
    sign_up
    expect { sign_up(handle:'different') }.not_to change(User, :count)
    expect(current_path).to eq '/users/new'
    # expect(page).to have_content('Email is taken')
  end
end