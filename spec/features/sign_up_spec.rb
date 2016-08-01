require_relative '../web_helper.rb'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, JoeBloggs93!')
    expect(User.first.email).to eq('test@example.com')
  end

  scenario 'User confirms with incorrect password' do
    expect { sign_up_confirmation_wrong }.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
    expect(current_path).to eq '/users'
  end

  scenario 'User cannot sign up without an email' do
    expect { sign_up_no_email }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
    expect(current_path).to eq '/users'
  end

  scenario 'User cannot sign up with invalid email format' do
    expect { sign_up_wrong_email }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
    expect(current_path).to eq '/users'
  end

  scenario 'User cannot sign up with same email twice' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
    expect(current_path).to eq '/users'
  end
end
