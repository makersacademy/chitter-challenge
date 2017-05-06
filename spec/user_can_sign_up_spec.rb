feature 'User can sign up for Chitter' do
  scenario 'user creates and account on Chitter' do
    visit '/'
    fill_in 'name', with: 'Ana Maria Suciu'
    fill_in 'username', with: 'ana'
    fill_in 'password', with: 'apples'
    fill_in 'email', with: 'ana@great.com'
    click_button 'Create Account'
    save_and_open_page
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Howdy, @ana! Peep now or forever hold your piss (Oh, noooo!)'
  end
end
