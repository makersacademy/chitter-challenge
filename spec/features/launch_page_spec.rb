feature 'Launch Page' do
  feature 'visiting the launch page' do
    scenario 'the welcome message is visible' do
      visit('/')
      expect(page).to have_content('Welcome to Chitter')
    end
  end
end