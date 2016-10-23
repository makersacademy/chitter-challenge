feature 'User Log Out' do

  before(:each) do
    User.create(first_name: 'Tony',
                last_name: 'Stark',
                email: 'tony.stark@starkindustries.com',
                password: 'jarvis',
                password_confirmation: 'jarvis',
                user_name: 'TDawg')
  end

  scenario 'while user is logged in' do
    log_in(email: 'tony.stark@starkindustries.com', password: 'jarvis')
    click_button 'Log Out'
    expect(page).to have_content('See you around!')
    expect(page).not_to have_content('Hola, test@test.com')
  end

end
