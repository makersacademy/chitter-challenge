feature 'User sign up' do
  scenario 'requires a matching passwords to sign up' do
    sign_up
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user cannot sign up without a valid email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'user cannot sign up if email address is already registered' do
    sign_up
    expect { sign_up(email: 'joesweeny84@hotmail.com') }.not_to change(User, :count)
  end

  scenario 'user cannot sign up with a username this is already registered' do
    sign_up
    expect { sign_up(username: 'joesweeny') }.not_to change(User, :count)
  end
end
