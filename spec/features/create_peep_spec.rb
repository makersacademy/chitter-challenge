feature 'visit create_peep' do
  scenario 'clicking "create_peep" takes you to the page' do
    visit('/')
    click_button('New Peep')
    expect(page).to have_content('Create a new peep')
  end

  scenario 'from the peeps page you can visit create a peep page' do
    visit('/peeps')
    click_button('Create a peep')
    expect(page).to have_content('Create a new peep')
  end
end


feature 'peeping' do
  scenario 'posting a peep shows it on the page' do
    visit('/')
    click_button('New Peep')
    fill_in "peep", with: "This is a test peep"
    click_button('Submit Peep')
    expect(page).to have_content('This is a test peep')
  end

  scenario 'posting a peep also displays its time' do
    visit('/')
    click_button('New Peep')
    fill_in "peep", with: "This is a test peep"
    click_button('Submit Peep')
    expect(page).to have_content(Time.now.strftime("%H:%M"))
  end
end
