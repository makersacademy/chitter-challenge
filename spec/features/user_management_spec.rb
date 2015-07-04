

feature 'User can sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    visit '/'
    expect(page).to have_content('Welcome, Elin')
    expect(User.last.email).to eq('elinnet@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong')}.not_to change(User,:count)
  end

  def sign_up(email: 'elinnet@gmail.com', name: 'Elin', password: 'password', password_confirmation: 'password')
      visit '/user/new'
      expect(page.status_code).to eq(200)
      fill_in :email, with: email
      fill_in :name, with: name
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign up'
  end






end



    # visit '/user/new'
    # fill_in 'name', with: 'Elin'
    # fill_in 'email', with: 'elinnet@gmail.com'
    # click_button 'Sign up'

    # expect(page).to have_content('Welcome, Elin')
  
