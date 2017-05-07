feature 'Sign Up Form' do

  scenario 'User can enter details into the sign up form' do
    enter_details
    click_button 'Submit Details'

    expect(page).to have_content 'Welcome to Chitter Tim Hawkins!'
  end

  scenario 'Requires a matching confirmation password from user' do
    enter_details
    fill_in('confirm_password', :with => 'cliveallen')

    expect { click_button 'Submit Details' }.not_to change(User, :count)
  end
end
