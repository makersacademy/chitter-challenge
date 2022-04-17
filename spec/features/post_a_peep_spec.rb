feature "#post" do
  scenario 'Allows user to post a message (peep)' do
    visit('/chitters')
    fill_in('peep', with: "My first peep")
    click_button("Submit")
    expect(page).to have_content "My first peep"
  end
end