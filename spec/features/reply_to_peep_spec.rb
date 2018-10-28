# As a Maker
# So that I can start a conversation
# I want to reply to a peep from another maker.

feature 'reply to a Peep' do
  scenario 'a user can reply to a peep' do
    register_user
    create_single_peep
    # p current_path
    click_link("Reply", match: :first)
    # p current_path
    expect(page).to have_content('Reply to')
    fill_in :peep, with: 'I am replying to this message'
    click_button('Reply')
    # p current_path
    expect(page).to have_content('Replying to Woohoo, I am peeping')
  end
end
