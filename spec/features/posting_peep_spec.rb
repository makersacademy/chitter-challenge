# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting a peep on Chitter' do
  scenario 'I want to post a peep' do
    sign_up
    sign_in
    visit '/peeps/new'
    fill_in 'message', with: 'My first peep'
    click_button 'Post'
    expect(page).to have_content 'My first peep'
  end

  scenario "I can't post a peep before sign_in" do
    visit'/peeps/new'
    expect(page).to have_content 'You should be signed in before posting a peep'
  end
end
