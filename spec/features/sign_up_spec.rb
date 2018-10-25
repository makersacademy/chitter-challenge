feature 'sign up' do
  scenario 'user can click sign up button' do
    visit '/chitter'
    click_button('Sign Up')
    expect(page).to have_content 'Enter your name'
    expect(page).to have_content 'Enter your username'
    expect(page).to have_content 'Enter your email address'
    expect(page).to have_content 'Enter your password'
  end 
end
