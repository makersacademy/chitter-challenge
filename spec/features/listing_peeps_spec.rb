require 'spec_helper'

feature 'See all peeps' do
  before(:each) do
    @user = User.create(name: "Alex",
              username: "AlexHandy1",
              email: "ah.com",
              password: "test",
              password_confirmation: "test"
      )
    Peep.create(message: "Hello world",
      user_id: @user.id)
    Peep.create(message: "Hello world 2",
      user_id: @user.id)
    Peep.create(message: "Hello world 3",
      user_id: @user.id)
  end
  scenario 'user can see all peeps on homepage' do
    visit ('/')
    expect(page).to have_content("Hello world")
    expect(page).to have_content("Hello world 2")
    expect(page).to have_content("Hello world 3")
  end

  xscenario 'user can see name and username of the user who posted peep' do


  end
end