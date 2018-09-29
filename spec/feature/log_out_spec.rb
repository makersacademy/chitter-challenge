feature 'log out' do

  before(:each) do
    User.create(username: 'RonWeasley',
                email: 'ron_weasley@hogwarts.co.uk',
                password: 'spider',
                password_confirmation: 'spider')
  end

  scenario 'when user is logged in' do
    sign_in(email: 'ron_weasley@hogwarts.co.uk', password: 'spider')
    click_button 'Log out'
    expect(current_path).to eq '/'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, RonWeasley')
  end
end
