feature 'peep replies' do
  scenario 'user replies to a peep' do
    add_test_peeps
    new_user
    log_in
    click_link "Reply"
    fill_in 'reply', with: "Reply"
    click_button "Submit"
    expect(page).to have_content 'Reply'
  end
end
