feature 'Signing up:' do
  scenario '- should allow user to enter details' do
    visit '/chitter'
    click_button 'Sign up'
    fill_in 'name', with: 'Jane'
    fill_in 'username', with: 'janesmith'
    fill_in 'password', with; 'password1'
    click_button 'Submit'
    expect(page).to have_content 'Welcome to Chitter, Jane'
  end
end
