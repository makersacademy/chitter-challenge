require "spec_helper"

feature 'Viewing posts' do
  scenario 'A user can see posts' do

    # Add the test data
    Posts.create(peep_text: "I will sleep", user_name: "Matt", created_at: '2019-06-22 19:10:25-07')
    Posts.create(peep_text: "I am awake", user_name: "Jeff", created_at: '2019-04-22 20:10:25-07')
    Posts.create(peep_text: "I have eaten", user_name: "Susan", created_at: '2019-06-22 11:10:25-07')
    visit('/posts')
    expect(page).to have_content("I will sleep")
    expect(page).to have_content("I am awake")
    expect(page).to have_content("I have eaten")
  end
end
