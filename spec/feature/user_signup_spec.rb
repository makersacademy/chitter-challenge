feature 'user signup' do
  scenario 'user can access sign up form' do
    visit '/'
    click_on('Sign Up')
    expect(page).to have_content('Name')
    expect(page).to have_content('Username')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end
end
