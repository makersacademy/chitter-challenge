feature 'view peep history' do
  scenario 'user can view peep history when click button' do
    sign_in_and_peep
    click_button "view history"
    expect(page).to have_content "Choose one of the options to view the history!"
  end
end
