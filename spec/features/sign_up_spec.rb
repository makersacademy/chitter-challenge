feature 'Users can sign-up' do
  scenario 'Users fill-in a form to sign-up' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter, bigbob'
  end

  scenario 'Users need a matching password confirmation' do
    expect{ sign_up(password_confirmation: "bbbbb") }.not_to change(User, :count)
    expect(current_path).to eq('/sign-up')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'User needs to enter an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'User can\'t sign-up with invalid email address' do
    expect { sign_up(email: "notvalid") }.not_to change(User, :count)
  end
  
  scenario 'Email address can only be used once' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end
  
  scenario 'Username has to be unique' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content "Username is already taken"
  end
  
  
end
