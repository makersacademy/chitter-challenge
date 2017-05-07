feature 'sign up experience' do
  scenario 'user enters necessary details' do
    sign_up
    expect(current_path).to eq '/chitter-newsfeed'
    expect(page).to have_content 'Welcome, Alexander Dominic Chalk'
  end

  scenario 'user enters two different passwords' do
    sign_up_password_mismatch
    expect(current_path).to eq '/sign-up'
  end
end
