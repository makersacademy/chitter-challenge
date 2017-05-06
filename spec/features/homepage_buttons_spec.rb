feature 'Sign Up/Log In Buttons' do

  scenario 'User can choose to sign up' do
    visit('/')
    click_link 'Sign Up!'
    expect(page).to have_content 'Please enter your details:'
  end
end
