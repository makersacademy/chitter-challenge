require 'spec_helper'

feature 'Viewing peeps' do
  scenario 'You don\'t need to be signed in' do
    user = create(:user)
    write_peep(user, 'Hello')
    click_button 'Sign out'
    visit '/peeps'
    expect(page).to have_content('Hello')
  end

  scenario 'I can see existing peeps' do
    user = create(:user)
    write_peep(user, 'Hi there!')
    write_peep(user, 'How is everyone?')
    visit '/peeps'
    expect(page).to have_content('Hi there!')
    expect(page).to have_content('How is everyone?')
  end

  scenario 'I can see peeps from users in reverse chronological order' do
    user_one = create(:user)
    user_two = create(:user_two)
    write_peep(user_one, 'Hi-de-hi!')
    write_peep(user_two, 'Howdy!')
    visit '/peeps'
    expect(page).to have_content('Hi-de-hi!')
    expect(page).to have_content('Howdy!')
    expect('Howdy!').to appear_before('Hi-de-hi!')
  end
end