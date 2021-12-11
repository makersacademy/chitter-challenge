feature 'Viewing peeps' do
    scenario 'visiting the peep feed' do
      visit('/')
      expect(page).to have_content "Welcome to Chitter!"
    end
  end