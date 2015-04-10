require 'spec_helper'

feature 'Signing up' do
  # break these up into seperate tests
  scenario 'as a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test_name')
    expect(page).not_to have_content('Password does not match the confirmation')
    expect(User.first.email).to eq('test@test.com')
    expect(User.first.name).to eq('test_name')
    expect(User.first.username).to eq('user_numero_uno')
  end

  context 'with a password that does not match' do
    scenario 'doesnt add the user to the database' do
      expect { sign_up('test@test.com', '12345', '12346') }.to change(User, :count).by(0)
    end

    scenario 'redirects the user back to the sign up form and displays an error' do
      sign_up('test@test.com', '12345', '12346')
      expect(current_path).to eq('/users')
      expect(page).to have_content('Password does not match the confirmation')
    end
  end

  scenario 'with an email that is already taken' do
    sign_up('test@test.com',
                   '12345',
                   '12345',
                   'test_name',
                   'unique_un_1')
    expect { sign_up('test@test.com',
                   '12345',
                   '12345',
                   'test_name',
                   'same name') } .to change(User, :count).by(0)
    expect(page).to have_content('This email address has be taken')
  end

  scenario 'with a username that is already taken' do
    sign_up('test@test.com',
                   '12345',
                   '12345',
                   'test_name',
                   'unique_un_1')
    expect { sign_up('unique_email@test.com',
                   '12345',
                   '12345',
                   'test_name',
                   'same name') } .to change(User, :count).by(0)
    expect(page).to have_content('This name has be taken')
  end

end

def sign_up(email = 'test@test.com',
            password = '12345',
            password_confirmation = '12345',
            name = 'test_name',
            username = 'user_numero_uno')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name, with: name
  fill_in :username, with: username
  click_button 'Sign up'
end