feature 'User sign up' do

  scenario 'users/new page loads correctly' do
    visit '/users/new'
    expect(page.status_code).to eq 200
  end

  scenario 'user can sign up with an email, password, name and username' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, alicetest")
    expect(User.first.email).to eq('alice@test.com')
  end

  scenario 'requires a matching password and password_confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "user can't sign up without entering an email address" do
    expect { sign_up(email: "") }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "user can't sign up without entering a name" do
    expect { sign_up(name: "") }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Name must not be blank'
  end

  scenario "user can't sign up without entering a username" do
    expect { sign_up(username: "") }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Username must not be blank'
  end



  def sign_up(email:    'alice@test.com',
              name:     'Alice Test',
              username: 'alicetest',
              password: 'secret1234',
              password_confirmation: 'secret1234')
    visit '/users/new'
    fill_in :email,     with: email
    fill_in :name,      with: name
    fill_in :username,  with: username
    fill_in :password,  with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end
