require 'chitter'

feature '.create' do
  scenario 'creating a new peep' do
    visit('/peeps/new')
    fill_in 'your_peep', with: "peep peep some text"
    click_button 'Submit'
    expect(page).to have_content("peep peep some text")
  end
end
