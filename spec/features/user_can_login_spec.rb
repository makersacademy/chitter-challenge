feature 'login' do
  scenario 'user is redirected to the login page' do
    visit '/'
    click_button 'Login'
    expect(current_path).to eq '/login'
  end
end
