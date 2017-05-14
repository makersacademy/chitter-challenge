feature 'Sign Up' do

  scenario 'registers users details when signing up' do
  expect { sign_up}.to change(User, :count).by(1)
  expect(User.first.email).to eq('b@ttle.com')
  end

  scenario 'prevents user from signing up without email' do
    expect { sign_up_no_email }.not_to change(User, :count)
    expect(current_path).to eq ('/user')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'prevents user from signing up without username' do
    expect { sign_up_no_username}.not_to change(User, :count)
  end

  scenario 'prevents sign in with incorrect email format' do
    expect {sign_up_incorrect_email_format}.not_to change(User, :count)
  end
end
