feature 'Users can sign up for chitter' do
  scenario 'User signs up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('alias')
  end
  scenario 'User can not sign up with two not matching passwords' do
    expect { sign_up_wrong_passwords }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Password does not match the confirmation'
  end
  scenario "User can not sign up without an email address" do
    expect { no_email }.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end
  scenario 'User can not sign up using an invalid email' do
    expect { invalid_email }.not_to change(User, :count)
    expect(page).to have_content 'Email has an invalid format'
  end
  scenario 'User can not sign up with an existing email or username' do
    sign_up
    click_button 'Sign out'
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content 'Email is already taken'
    expect(page).to have_content 'Username is already taken'
  end
end
