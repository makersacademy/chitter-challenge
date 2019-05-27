feature 'homepage' do
  it 'will let me sign in' do
    visit '/chitter'
    fill_in 'email', with: 'lisa@email.com'
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'Lisa'
    fill_in 'username', with: '@username'
    click_button 'Sign in'
    expect(page).to have_content 'Welcome Lisa!'
    expect(page).to have_field 'peep'
    expect(page).to have_button 'Post'
  end
end
