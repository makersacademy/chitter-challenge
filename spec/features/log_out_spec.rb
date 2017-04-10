feature 'User log out' do

  before(:each) do
    User.create(email: 'echai93@gmail.com',
                password: 'brocolli',
                password_confirmation: 'brocolli')
  end

  scenario 'user successfully logs out' do
    log_in
    click_button 'Log out'
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Welcome, echai93@gmail.com'
  end
end
