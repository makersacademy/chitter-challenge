feature 'Sign Up' do

  scenario 'displays welcome message when signing up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, newbie')
    expect(User.first.email).to eq('newbie@gmail.com')
  end

  scenario 'requires matching confirmation password' do
    expect{ sign_up_fail(password_confirmation: 'wrong') }.not_to change( User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'I can\'t sign up without an email address' do
    expect{ sign_up_fail(email: nil) }.not_to change(User, :count)
  end

  scenario 'I can\'t sign up with an invalid email address' do
    expect{ sign_up_fail(email: "invalid@email") }.not_to change(User, :count)
  end


  def sign_up_fail(email: 'newbie@gmail.com', password: '123', password_confirmation: '123')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password, with: password_confirmation
    click_button 'Sign up'
  end

end
