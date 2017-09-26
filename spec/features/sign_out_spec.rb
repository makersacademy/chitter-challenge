feature 'User signs out' do

  before(:each) do
    User.create(name: 'Annabel Ya',
                username: 'anna',
                email: 'annabel@example.com',
                password: 'secret6789',
                password_confirmation: 'secret6789')
  end


  scenario 'while being signed in' do
    sign_in(email: 'annabel@example.com', password: 'secret6789')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, anna')
  end

end
