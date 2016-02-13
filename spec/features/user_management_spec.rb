feature 'User sign up' do

  scenario 'requires a matching confirmation password' do
    expect {sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
  
  scenario 'with a password that does not match' do
    expect {sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "I can't sign up without an e-mail address" do
    expect {sign_up(email: nil) }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end
 
  scenario "I can't sign up with an invalid e-mail address" do
   expect {sign_up(email: "invalid@email") }.not_to change(User, :count)
   expect(current_path).to eq('/users')
   expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing e-mail' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end


  def sign_up(email: 'bingo@mail.com', password: 'abcd123', password_confirmation: 'abcd123')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end
end

