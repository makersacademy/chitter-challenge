require 'spec_helper'

feature 'Viewing Peeps' do
  # scenario 'I expect to see the time at which the peep was made' do
  #   user = create :user
  #   post_peep(user, 'Hello World!')
  #   click_button 'Post'
  #   visit '/peep'
  #   within 'ul#peep' do
  #     t = Time.now
  #     expect(page).to have_content t.strftime("%b %e, %l:%M %p")
  #   end
  # end

  scenario 'I expect to see the username of the user who posted the peep' do
    user = create :user
    sign_in(user)
    post_peep(user, 'Hello World!')
    visit '/peep'
    expect(page).to have_content('Hello World!')
    expect(page).to have_content('danstpaul')
  end

  # scenario 'I can see peeps from users in reverse chronological order' do
  #   user = create :user
  #   post_peep(user, 'Hello World!')
  #   post_peep(user, 'Hello Again!')
  #   visit '/peep'
  #   expect(page).to have_content('Hello World!')
  #   expect(page).to have_content('Hello Again!')
  #   expect('Hello Again!').to appear_before('Hello World!')
  # end
end
