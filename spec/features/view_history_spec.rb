feature 'view peep history' do
  scenario 'user can view peep history when click button' do
    sign_in_and_peep
    click_button "view history"
    expect(page).to have_content "Choose one of the options to view the history!"
  end
end

feature 'view history in chronologic_order' do
  scenario 'user can view the history of messages in reverse chronologic order' do
    sign_in_and_peep
    click_button "chronological order"
    expect(page).to have_content "Hello! I am having lunch, 2018-02-18"
  end
end
