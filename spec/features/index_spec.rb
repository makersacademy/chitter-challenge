require 'sinatra'

feature 'Chitter Homepage' do
  scenario 'Displays a homepage' do
    visit('/')
    expect(page).to have_content("Welcome to Chitter")
  end

  scenario "Displays a link to view-peeps" do
    visit('/')
    expect(page).to have_link('Click here to view all Peeps', href: 'http://localhost:9292/view-peeps')
  end

  scenario "Displays a link to post a Peep" do
    visit('/')
    expect(page).to have_link('Click here to post a peep', href: 'http://localhost:9292/post-peep')
  end
end
