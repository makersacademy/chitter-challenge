RSpec.feature 'infrastructure' do
  context 'Displaying webpages' do
    scenario 'Can visit homepage' do
      visit '/'
      expect(page).to have_content "Welcome to Chitter"
    end
  end
end
