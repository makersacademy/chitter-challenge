
describe 'Bookmark Manager' do

  feature 'Index page' do
    scenario 'has index page' do
      visit('/')
      expect(page).to have_content("Chitter")
    end
  end


end
