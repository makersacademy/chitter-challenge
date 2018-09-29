describe 'Chitter Feature' do

  feature 'Visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
      expect(page.status_code).to eq(200)
      expect(page).to have_content('Chitter')
    end
  end

end
