feature 'user can log in' do
  scenario 'user enters correct login details' do
    sign_up
    visit '/log-in'
    fill_in 'email_address', with: 'test@example.com'
    fill_in 'password', with: 's3cr3t'
    click_on 'Log In'
    expect(current_path).to eq '/chitter-newsfeed'
  end
  scenario 'user enters wrong login details' do
    sign_up
    visit '/log-in'
    fill_in 'email_address', with: 'test@example.com'
    fill_in 'password', with: 'wrong_s3cr3t'
    click_on 'Log In'
    expect(current_path).to eq '/log-in'
  end
end
