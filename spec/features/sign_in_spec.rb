feature 'Signing in' do
  scenario 'signing in allows me to use my username' do
    visit('/')
    click_button('Sign In')
    fill_in('username', with: 'charliecodes')
    click_button('Sign In')
    
    expect(page).to have_content('Hello charliecodes,')
  end
end
