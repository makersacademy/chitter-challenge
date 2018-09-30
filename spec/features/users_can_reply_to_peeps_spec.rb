feature 'the user can reply to peeps' do
  scenario 'when signed in and there is a peep to reply to' do
    log_in_as_billy
    first('.peep').click_button('Reply')
    fill_in 'reply_content', with: "That's true!"
    click_button 'Reply'
    expect(page).to have_content "That's true!"
    log_out_of_page
  end
end
