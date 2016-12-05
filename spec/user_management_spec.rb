feature 'User sign up' do

  scenario 'with a password that does not match' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: 'bryony@bryony.com'
    fill_in :password, with: 'lemons'
    fill_in :name, with: 'bryony'
    fill_in :username, with: 'bryorama'
    fill_in :password_confirmation, with: 'strawberry'
    click_button 'Sign up'
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bryorama')
    expect(User.first.email).to eq('bryonywatson1@googlemail.com')
  end




end
