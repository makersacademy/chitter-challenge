feature 'Sign Up' do
  let(:name) { 'Thelonious' }
  let(:username) { 'Thelo88' }
  let(:email) { 'thelonious_monk@piano.com' }
  let(:password) { '884lyf' }
  let(:password_confirmation) { '884lyf' }

  scenario 'requires name, username, email and password' do
    sign_up
    expect{ click_button 'Register' }.to change{ Maker.count }.by 1
  end

  scenario 'does not register new maker when password mismatch' do
    sign_up
    fill_in :password_confirmation, with: '888lyf'
    expect{ click_button 'Register' }.not_to change{ Maker.count }
  end

  scenario 'email is unique' do
    sign_up
    click_button 'Register'
    sign_up
    fill_in :username, with: 'Not_Thelo'
    expect{ click_button 'Register' }.not_to change{ Maker.count }
    expect(page).to have_content "You've already signed up with this email. Forgot about that, huh?"
    expect(current_path).to eq '/register'
  end

  scenario 'username is unique' do
    sign_up
    click_button 'Register'
    sign_up
    fill_in :email, with: 'monk88@piano.com'
    expect{ click_button 'Register' }.not_to change{ Maker.count }
    expect(page).to have_content "Someone else beat you to this incredible username. Sorry."
    expect(current_path).to eq '/register'
  end

end
