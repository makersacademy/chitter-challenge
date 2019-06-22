require_relative '../helpers/add_users_peeps'

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the user who posted the peep at which it was made

feature 'author name is presented with peep' do
  scenario 'peep has author name' do

    create_users_peeps

    visit('/peeps')

    expect(page).to have_content('Author: JD')
    expect(page).to have_content('Author: MZ')

  end
end