feature 'On Peeps page' do
  background { truncates }
  background { add_peep }

  scenario 'user can navigate to Peeps page and see all peeps' do
    visit('/')
    click_link('All Peeps')
    expect(page).to have_content "Hey, this is my first test peep!"
  end
  
end