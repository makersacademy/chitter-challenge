require 'pg'

feature 'index page' do
  scenario 'Shows the homepage' do
    visit '/'
    expect(page).to have_content("chitter")
    expect(page).to have_content("what are you up to?")
    expect(page).to have_field('new_peep')
    expect(page).to have_selector(:link_or_button, 'peep')
    expect(page).to have_content("latest peeps")
  end
end
