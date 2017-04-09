feature 'sign up' do

  scenario 'user signs up succesfully' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Wizard_Trish')
    expect(User.first.email).to eq 'Trisha@person.com'
  end

  scenario 'cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'cannot sign up with an invalid email' do
    expect { sign_up(email: 'invalid@invalid') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
  end

  scenario 'cannot sign up with existing email address' do
    sign_up
    expect { sign_up(username: 'Muggle_Trish') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
  end

  scenario 'cannot sign up with existing username' do
    sign_up
    expect { sign_up(email: 'Ben@person.com') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
  end

  def sign_up(email: 'Trisha@person.com',
              username: 'Wizard_Trish',
              password: 'password')
    visit '/users/new'
    fill_in(:name, with: 'Trisha')
    fill_in(:email, with: email)
    fill_in(:username, with: username)
    fill_in(:password, with: password)
    click_button('Sign up')
  end

end
