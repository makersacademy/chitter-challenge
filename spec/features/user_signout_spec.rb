feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                nom_name: 'nom handle',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, nom handle')
  end

end
