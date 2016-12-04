feature 'a user can sign up to chitter' do

  scenario 'a user can complete a sign up form' do
    visit('/')
    click_button('Sign up')
    expect(current_path).to eq('/sign-up')
    expect(page).to have_content('Please sign up to peep to the world!')
    expect(page).to have_field('Name')
    expect(page).to have_field('User name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_button('Sign me up!')
  end

end
