require_relative 'web_helper'

feature 'A user can tag another user in a message' do
  scenario "A user tags another user" do
    sign_up
    login
    fill_in('message', with: 'second test @tester')
    click_on 'Post'

    expect(page).to have_link('@tester')
  end
end
