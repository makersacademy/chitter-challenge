feature 'Sign Up/Log In Buttons' do

  scenario 'User can choose to sign up' do
    visit('/')
    click_link 'Sign Up!'
    expect(page).to have_content 'Sign Up!'
  end

  scenario 'User can choose to log in' do
    visit('/')
    click_link 'Log In!'
    expect(page).to have_content 'Log In!'
  end

end
