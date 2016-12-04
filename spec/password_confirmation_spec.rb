feature 'password needs to be the same' do
  scenario 'I need to enter my password twice as the same to sign up' do
    expect{different_passwords}.to change{User.count}.by 0
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Cannot sign up: password and password confirmation do not match')
  end
end
