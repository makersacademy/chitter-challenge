feature 'Testing infrastructure' do
    scenario 'visiting the index page' do
      visit('/')
      expect(page).to have_content "You have signed up successfully"
    end
  end
