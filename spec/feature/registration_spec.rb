
feature 'registration' do
  scenario 'a user can sign up' do

    visit '/'
    fill_in('email', with: 'joe@blogs.co.uk')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content 'Welcome to Chitter'
  end
end
