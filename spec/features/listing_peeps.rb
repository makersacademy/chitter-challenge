require_relative 'web_helper'

feature 'User browses the list of links' do
  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end
  scenario 'opening the home page' do
    user = User.first
    Peep.create(content: "Aloha!!",
                user: user,
                created_at: Time.now)
    Peep.create(content: "Damn it!!",
                user: user,
                created_at: Time.now)
    expect(Peep.count).to eq(2)
    visit '/'
    expect(page).to have_content("Aloha!!")
  end
end
