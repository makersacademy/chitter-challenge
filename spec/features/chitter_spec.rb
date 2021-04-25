feature 'chitter main page' do
  scenario 'the main page should welcome the user' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end

  scenario 'it allows user to sign in to view peeps' do
    visit '/'
    click_button 'Sign in'
    expect(current_path).to eq '/peeps'
  end
end
