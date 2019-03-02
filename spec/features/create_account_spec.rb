feature 'creating accounts' do
  scenario 'an account is created for the new user' do
    
    visit '/signup'
    fill_in :email, with: 'user@example.com'
    fill_in :password, with: '123456'
    click_button 'Sign-up!'

    expect(page).to have_content 'Hello, user@example.com'
  end
end
