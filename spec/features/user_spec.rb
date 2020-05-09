feature 'user' do
  scenario 'able to go to sign-in page' do
    visit('/')
    click_button 'Sign Up'

    expect(current_path).to eq '/user/sign-up'
  end

  scenario 'able to go to sign-up page' do
    visit('/')
    click_button 'Log In'

    expect(current_path).to eq '/user/log-in'
  end

end