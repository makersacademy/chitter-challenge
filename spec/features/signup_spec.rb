feature 'sign up' do
  scenario 'can access the sign up page' do
    visit('/')
    click_button('Sign up')
    expect(page).to have_content 'Sign up'
    fill_in('username', with: 'mmm')
    fill_in('password', with: 'ooh')
    click_button('Submit')
  end
end
