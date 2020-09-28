feature 'sign up button' do
  it 'takes to form and return name by peep on homepage' do
    visit '/'
    click_on('Sign up')
    fill_in 'username', with: "Xavier"
    fill_in 'email', with: "xdef@test.com"
    fill_in 'password', with: "chewwwbaaaah"
    click_on('Submit')
    expect(page).to have_content('Welcome Xavier')
  end 
end