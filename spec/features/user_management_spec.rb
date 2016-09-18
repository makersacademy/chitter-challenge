feature 'User sign up' do
  scenario 'requires matching passwords to sign up' do
    sign_up
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user cannot sign up without a valid email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'user cannot sign up if email address is already registered' do
    sign_up
    expect { sign_up(email: 'joesweeny84@hotmail.com') }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'user cannot sign up with a username that is already registered' do
    sign_up
    expect { sign_up(username: 'joesweeny') }.not_to change(User, :count)
  end
end
