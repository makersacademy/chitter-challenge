feature 'Home Page' do
  before { visit('/') }

  scenario 'Has a welcome message' do
    expect(page).to have_content('Welcome to Chitter!')
  end

  context 'before you sign up/in' do
    scenario 'Has a button to sign up when you first visit' do
      click_button('Sign up for Chitter')
      expect(page.current_path).to eq '/users/new'
    end
    scenario 'does not show the write peep form' do
      expect(page).not_to have_selector('.write_peep')
    end
  end

end
