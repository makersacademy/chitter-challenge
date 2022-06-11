feature 'creating chits' do
  scenario 'A user should be able to create a chit' do
    visit('/chits/new')
    fill_in 'chit', with: "I'm adding another chit"
    click_button "Send Chit"

    expect(page).to have_content "I'm adding another chit"
  end
end