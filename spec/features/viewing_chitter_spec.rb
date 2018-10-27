RSpec.feature 'Viewing Chitter' do

  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Chitter'
  end

  scenario 'allows the user to post a peep' do
    visit('/')
    fill_in('peep',with: "Hello World")
    click_button('Submit')
    expect(page).to have_content 'Hello World'
  end

end
