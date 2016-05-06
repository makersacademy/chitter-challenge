feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the homepage' do
    Peep.create(title: 'Capybara', content: 'Sooooo cute!')
    visit '/peeps'
    expect(page.status_code).to eq(200)
    within 'ul#peeps' do
      expect(page).to have_content('Capybara')
    end
  end
end
