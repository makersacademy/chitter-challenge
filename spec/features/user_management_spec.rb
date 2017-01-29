feature 'User sign up' do

  scenario 'A new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome back, dylanrhodius.'
    expect(User.first.email).to eq 'dylan@bossman.com'
  end

  scenario 'Wrong password confirmation raises an error' do
    wrong_sign_up
    expect { wrong_sign_up }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'Leaving email field blank does not allow sign up' do
    no_email
    expect { no_email }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'Malformed email does not alllow sign up' do
    wrong_email_format
    expect { wrong_email_format }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'Sign up with existing address is not allowed' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

end
