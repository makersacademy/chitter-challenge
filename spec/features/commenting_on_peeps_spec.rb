require 'spec_helper'

feature "When commenting on peeps from users" do
  before(:each) do
    User.create(name: "Isabel",
                username: "Isabel",
                email: 'isabel@example.com',
                password: 'test',
                password_confirmation: 'test')
    Peep.create(peep: "My peep", user_id: 1)
  end

  scenario "A user will be able to comment on a peep" do
    log_in
    visit('/peeps/1')
    fill_in("comment", :with => "Cool peep")
    click_button('Add comment')
    expect(page).to have_content("Cool peep")
  end

end
