feature 'On Peeps page' do
  # background { truncates }

  scenario 'user can navigate to Peeps page and see all Peeps' do
    visit('/peeps')
    # click_link('Peeps')
    expect(page).to have_content "Hey, this is my first test peep!"
  end
end