feature 'Sign up' do
  scenario 'allows users to sign up as them selfs' do
    sign_up()
    fill_in 'comment', with: 'This is a test.'
    click_button('post')
    
    expect(page).to have_content('Tester Posted: This is a test.')
  end
  
end