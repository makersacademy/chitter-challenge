feature 'User sign up' do 

  # scenario 'I can sign up as a new user' do 
  #   expect { sign_up }.to change(User, :count).by(1)
  #   expect(page).to have_content('Welcome, dom@example.com')
  #   expect(User.first.email).to eq('dom@example.com')
  # end

  scenario 'I can sign up as a new user' do 
    visit '/users/new'
    fill_in :email,    with: 'dom@example.com'
    fill_in :name,    with: 'dom'
    fill_in :username,    with: 'dbatten'
    fill_in :password, with: 'password'
    expect { click_button('Sign up') }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, dbatten')
    expect(User.first.email).to eq('dom@example.com')
  end

 def sign_up(email: 'dom@example.com',
            password: '123')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: password
  click_button 'Sign up'
end




end