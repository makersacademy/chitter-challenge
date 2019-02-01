require_relative 'web_helpers'

feature 'posting message' do
  scenario 'user can post a message' do
    visit('/peeps')
    make_a_peep("My first Peep!")
    make_a_peep('My second Peep!')
    expect(page).to have_content("My second Peep! My first Peep!")
  end
end
