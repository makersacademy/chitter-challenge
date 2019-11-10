feature 'Home page' do
  scenario 'displays username of new user' do
    visit('/')
    click_button('Register')
    fill_in('name', with: 'Tom')
    fill_in('email', with: 'chitter_test@outlook.com')
    fill_in('password', with: 'twatter8')
    click_button('Submit')
    expect(page).to have_content('Hi, Tom!')
  end
end
