require_relative 'web_helper'

feature 'can view messages posted to chitter' do
  scenario 'a user can view one peep' do
    sign_up
    test_peep

    visit '/peeps'

    expect(page).to have_content 'Test'
  end

  scenario 'a user can view multiple peep' do
    sign_up
    test_peep
    test_peep2
    test_peep3

    visit '/peeps'

    expect(page).to have_content 'Test Peep'
    expect(page).to have_content 'Test Peep 2'
    expect(page).to have_content 'Test Peep 3'
  end

  scenario 'peeps show user who posted them' do
    sign_up
    test_peep

    expect(page).to have_content 'Test(Tester):'
    expect(page).to have_content 'Test Peep'
  end

end
