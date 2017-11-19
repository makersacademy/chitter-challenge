feature 'User signs out' do

  before(:each) do
    user_create
  end

  scenario 'while User is signed in' do
    sign_in(email: 'thatdania@gmail.com', password: 'potatoes')
    click_button 'Sign out'
    expect(page).to have_content('We will miss you!')
    expect(page).not_to have_content('Hey thatdania!')
  end

end
