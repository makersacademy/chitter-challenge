require_relative '../helpers/add_users_peeps'
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'created time visible on a peep' do
  scenario 'each peep has a created time ' do
    create_users_peeps

    visit('/peeps')

    expect(page).to have_content(Time.new.year)
    expect(page).to have_content(Time.new.hour)


  end
end
