feature 'User sign up' do 

  scenario 'I can sign up as a new user' do 
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, dbatten')
    expect(User.first.email).to eq('dom@example.com')
  end

  scenario 'Requires a matching password' do 
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'dom@example.com',
            name: 'dom',
            username: 'dbatten',
            password: '123',
            password_confirmation: '123')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :name,    with: name
    fill_in :username,    with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end