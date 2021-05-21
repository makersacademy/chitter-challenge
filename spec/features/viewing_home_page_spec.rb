
feature 'Viewing home page' do
  feature 'visiting the homepage' do
    scenario 'visiting the index page' do
      visit('/')
      expect(page).to have_content('Chitter Application')
    end
  end
end