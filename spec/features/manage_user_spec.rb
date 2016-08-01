feature 'User sign up' do
  scenario 'password confirmation does not match' do
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
    expect { sign_up(email: 'alwins@gmail.com') }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'user cannot sign up with an already registered email' do
    sign_up
    expect { sign_up(username: 'alwins') }.not_to change(User, :count)
  end
end
