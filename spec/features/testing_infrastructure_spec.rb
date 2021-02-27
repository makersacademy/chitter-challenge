feature 'Viewing page' do
    scenario 'Testing infrastructure' do
      visit('/')
      expect(page).to have_content 'Hello world'
    end
end
