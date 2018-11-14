require_relative 'web_helpers'

feature 'Viewing peeps' do
  # as a social media user
  # so i can see the chitter feed
  # i want to be able to view the chitter peeps in reverse chronological order
  scenario 'A user can see the peeps' do
    Peep.create(text: 'the sky is blue')
    Peep.create(text: 'the sea is green')
    Peep.create(text: 'fire is red')
    sign_up
    visit('/peeps')

    expect(page).to have_content("the sky is blue")
    expect(page).to have_content("the sea is green")
    expect(page).to have_content("fire is red")
  end
end
