feature 'Home Page' do

  scenario 'Has a welcome message' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter!')
  end

  scenario 'Has a button to sign up when you first visit' do
    visit('/')
    click_button('Sign up for Chitter')
    expect(page.current_path).to eq '/users/new'
  end

end
