feature 'Homepage' do
  scenario 'the user should be able to post a peep' do
    peep_hello
    expect(page).to have_content 'Hello you chitters'
  end

  # scenario 'the homepage displays peeps in reverse chronological order' do
  #   peep_hello
  #   peep_christmas
  # end

  # scenario 'a posted peep should be visible on the chitter home page' do
  #
  # end
end
