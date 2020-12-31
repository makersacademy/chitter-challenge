require_relative './web_helpers.rb'

feature 'peeps on the /peeps page' do
  scenario 'are displayed in reverse chronological order' do
    sign_in_to_chitter

    click_link 'New Peep'

    fill_in 'peep[message]', with: 'First Peep'
    click_button 'Post Peep'

    click_link 'New Peep'

    fill_in 'peep[message]', with: 'Second Peep'
    click_button 'Post Peep'

    expect(first('.peep')).to have_content 'Second Peep'
  end

  scenario 'are displayed with created time/date' do
    sign_in_to_chitter
    user = User.all.first
    user.peeps.create(message: "peep posted at 21:41 on 29/12/2020", created_at: '2020-12-29 21:41:42.689775')
    visit '/peeps'

    expect(first('.peep')).to have_content '21:41 29/12/2020'
  end

  scenario "show user's name and username (chitter handle)" do
    sign_in_to_chitter

    user = User.all.first

    click_link 'New Peep'

    fill_in 'peep[message]', with: 'My peep'
    click_button 'Post Peep'

    expect(first('.peep')).to have_content "#{user.name}"
    expect(first('.peep')).to have_content "#{user.username}"
  end
end
