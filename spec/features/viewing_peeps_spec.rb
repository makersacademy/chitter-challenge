
describe "viewing peeps" do

  scenario "it shows all peeps in reverse chronological order" do
    visit('/peeps/new')
    fill_in :peep, with: 'First tweet!'
    click_button 'PEEP!'
    visit('/peeps/new')
    fill_in :peep, with: 'Second tweet!'
    click_button 'PEEP!'
    expect(page).to have_content('First tweet!')
    expect(page).to have_content('Second tweet!')
    # how to expect order?
  end

  scenario "it shows the time at which a peep was made" do
    visit('/peeps/new')
    fill_in :peep, with: 'First tweet!'
    click_button 'PEEP!'
    expect(page).to have_content('First tweet!')
  end

end
