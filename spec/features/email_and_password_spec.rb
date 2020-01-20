feature 'Entering email and password' do
  scenario 'it asks user to log in' do
    visit('/')
    fill_in :name, with: 'Asia'
    fill_in :email, with: 'hello123@gmail.com'
    fill_in :password, with: 'password'
    click_button('Sign up')
    expect(page).to have_content 'Welcome to Chitter Asia'
  end
end