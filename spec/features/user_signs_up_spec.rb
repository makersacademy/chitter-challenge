feature 'signup' do
  scenario 'a user can go to sign up page' do
    visit '/'
    click_on('Sign Up')

    expect(page).to have_content 'Please Enter Your Name'
    expect(page).to have_content 'Please Enter A Username'
    expect(page).to have_content 'Please Enter Your Email'
    expect(page).to have_content 'Please Enter A Password'
  end
end
