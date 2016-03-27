feature 'Sign up' do
  scenario 'user can go to registration page' do
    visit '/'
    click_link 'Sign up'
    expect(current_path).to eq '/users/new'
  end

  scenario 'user can fill out registration form' do
    sign_up
    expect(current_path).to eq '/'
    expect(page).to have_content("Welcome, Anne")
  end

  scenario 'user gets saved in database' do
    expect { sign_up }.to change{ User.count}
  end

  scenario 'login fields can\'t be empty' do
    expect { sign_up(first_name: nil) }.to_not change{ User.count}
  end

  scenario 'username must be unique' do
    sign_up(username: 'CrazyKid')
    expect { sign_up(username: 'CrazyKid') }.to_not change{ User.count}
  end

  scenario 'email must be unique' do
    sign_up(email: 'CrazyKid@fun.com')
    expect { sign_up(email: 'CrazyKid@fun.com') }.to_not change{ User.count }
  end

  scenario 'email must have valid format' do
    expect { sign_up(email: 'CrazyKid-fun.com') }.to_not change{ User.count }
  end

  scenario 'password confirmation must match password' do
    expect { sign_up(password: 'lion', password_confirmation: 'cat') }.to_not change{ User.count }
  end

  scenario 'restart registration and show error if passwords don\'t match' do
     expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
     expect(current_path).to eq '/users'
     expect(page).to have_content 'Password does not match the confirmation'
   end
end
