feature 'Signing up and logging in' do
  scenario 'user signs up and is added to the database' do
    visit('/')
    click_button('sign up')
    fill_in :name, with: 'tester'
    fill_in :email, with: 'email@email.com'
    fill_in :password, with: 'test123'
    expect { click_button 'submit' }.to change(User, :count).by(1)
  end

  scenario 'user logs in and is greeted by their name' do
    sign_up
    click_button('logout')
    login
    expect(page).to have_content('Hello Tester!')
  end

  scenario 'user logs in with wrong password' do
    sign_up
    click_button('logout')
    visit('/')
    click_button('login')
    fill_in :email, with: 'email@email.com'
    fill_in :password, with: 'wrongpassword'
    click_button('submit')
    expect(page).to have_content('Please login')
    expect(page).to_not have_content('Hello Tester!')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    click_button('logout')
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email address already registered')
  end
end
