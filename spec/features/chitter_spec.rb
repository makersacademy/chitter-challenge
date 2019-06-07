# Capybara.default_driver = :selenium
# Capybara.server = :webrick

feature 'chitter' do
  before(:each) do
    Peep.destroy
    create_peeps
  end

  Capybara.default_driver = :selenium
  Capybara.server = :webrick

  feature 'viewing peeps' do 
    scenario 'peep is present on the page' do
      visit '/'
      expect(page).to have_css('.text', text: 'First ever peep!!!!')
    end

    scenario 'peeps are in chronological order' do
      visit '/'
      within all('.peep').last do
        expect(page).to have_css('.text', text: 'First ever peep!!!!')
      end
    end
  end
end