feature 'registration' do
  scenario 'a user can sign up!' do
    visit '/'
    click_link 'log in'
    expect(page.current_path).to eq '/login'
    click_link "Don't have an account? Sign up here!"
    expect(page.current_path).to eq '/login/new'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Leggo!'
    expect(page.current_path).to eq '/welcome'
    expect(page).to have_content 'Welcome to chitter, test@example.com!'
    click_link 'Now lemme see those peeps!'
    expect(page.current_path).to eq '/'
  end
end
