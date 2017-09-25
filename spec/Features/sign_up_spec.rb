feature 'Signing up' do
  scenario 'user signs up and is added to the database' do
    visit('/')
    click_button('sign up')
    fill_in :name, with: 'Nero'
    fill_in :email, with: 'nero@nero.com'
    fill_in :password, with: 'nero123'
    expect { click_button 'submit' }.to change(User, :count).by(1)
  end

  scenario 'user logs in and is greeted by their name' do
    visit('/')
    click_button('login')
    fill_in :email, with: 'nero@nero.com'
    fill_in :password, with: 'nero123'
    click_button('submit')
    expect(page).to have_content('Hello Nero')
  end
end
