require_relative 'web_helpers'

feature 'posting message' do
  scenario 'user can post a message' do
    visit('/peeps')
    make_a_peep("My first Peep!")
    expect(page).to have_content("My first Peep!")
  end
end
