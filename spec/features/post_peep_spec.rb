require 'sinatra'

feature "/post-peep" do
  scenario "posts a peep" do
    visit('/post-peep')
    fill_in 'peep', with: 'my first peep'
    click_on 'Submit'
    expect(page).to have_content("my first peep")
  end
end
