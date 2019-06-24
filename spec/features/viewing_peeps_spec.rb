RSpec.feature 'List of Peeps' do
  scenario 'correctly redirected from Welcome screen' do
    visit '/'
    click_link 'See all Peeps'
    expect(page).to have_content('Chitterz')
  end
  
  xscenario 'Peep is visible' do
  end

  pending 'Several Peeps are visible'

  pending 'Peeps are correctly ordered'
end