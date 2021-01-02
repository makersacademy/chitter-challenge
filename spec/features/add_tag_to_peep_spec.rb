require_relative './web_helpers.rb'

feature 'add a tag to a peep' do
  scenario 'user can tag another user in a peep' do
    create_users
    sign_in_to_chitter

    click_link 'New Peep'
    fill_in 'peep[message]', with: 'My first test peep'
    find('#tag').find(:option, '@Test_username2').select_option
    # fill_in 'tag', with: '@Test_username2'
    click_button 'Post Peep'

    expect(first('.peep')).to have_content '@Test_username2'
  end
end
