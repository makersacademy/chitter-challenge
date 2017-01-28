feature 'User sign up' do

  scenario 'A new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, dylan@bossman.com'
    expect(User.first.email).to eq 'dylan@bossman.com'
  end

  scenario 'Wrong password confirmation raises an error' do
    wrong_sign_up
    expect { wrong_sign_up }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

end
