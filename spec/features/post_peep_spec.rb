require 'sinatra'

feature "/post-peep" do
  scenario "posts a peep" do
    visit('/post-peep')
    fill_in 'peep', with: 'my first peep'
    click_on 'Submit'
    expect(page).to have_content("View all peeps here!")
  end
end
