
feature 'User can sign up' do
  scenario 'User signs up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome John!'
  end
end

feature 'User can sign in' do
  scenario 'User signs in with correct password' do
    sign_up
    visit '/sign_in'
    fill_in 'username', with: 'John_Doe'
    fill_in 'password', with: 'secret'
    click_button 'Log In'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome John'
  end

  scenario 'User signs in with incorrect password' do
    sign_up
    visit '/sign_in'
    fill_in 'username', with: 'John_Doe'
    fill_in 'password', with: 'wrong'
    click_button 'Log In'
    expect(current_path).to eq '/sign_in'
  end
end

feature 'User can sign out' do
  scenario 'User signs out' do
    sign_up
    sign_out
    expect(current_path).to eq '/'
    expect(page).to have_content 'Goodbye John'
  end
end
