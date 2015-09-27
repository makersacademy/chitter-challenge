feature 'User sign in' do

  # scenario 'Clicking sign in takes me to the sign in page' do
  #   visit '/users/new'
  #   click_button('Sign in')
  #   expect(current_path).to eq('/sessions/new')
  #   expect(page).to have_content('Sign In')
  # end

  scenario 'I am welcomed after signing in' do
    visit '/'
    user = create :user
    sign_in_as(user)
    expect(page).to have_content("Welcome, dbatten")
  end

end