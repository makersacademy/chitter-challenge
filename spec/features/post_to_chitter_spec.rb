# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'so that users can let people know what they are doing' do
  scenario 'a user wants to post a peep to chitter' do
    visit ('/post-peep')
    fill_in 'peep_content', with: "Hello chitter!"
    click_button ('Post peep')
    visit '/homepage'
    expect(page).to have_content "Hello chitter!"
  end
end
