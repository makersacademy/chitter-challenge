require 'pg'

feature 'index page' do
  scenario 'Shows the homepage' do
    visit '/'
    expect(page).to have_content("chitter")
    expect(page).to have_content("what are you up to?")
    expect(page).to have_field('new_peep')
    expect(page).to have_selector(:link_or_button, 'peep')
    expect(page).to have_content("latest peeps")

    fill_in('new_peep', with: 'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.')
    click_button('peep')

    expect(page). to have_content('A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.')

  end
end
