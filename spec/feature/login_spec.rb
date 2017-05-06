feature 'log in capability' do
  scenario 'user can sign up' do
    DatabaseCleaner.clean
    visit '/'
    fill_in 'name', with: 'Ahmed'
    fill_in 'user_name', with: 'hyper0009'
    fill_in 'email', with: 'smokey@yahoo.com'
    fill_in 'password', with: 'hot7575'
    click_button 'submit'
    expect(User.count).to eq 1
    expect(page).to have_content 'Welcome hyper0009'
  end
end
