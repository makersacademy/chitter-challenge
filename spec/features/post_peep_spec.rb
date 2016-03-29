feature 'Posting a peep' do
  scenario 'There is text entry available for a user' do
    sign_up_correctly
    expect(page).to have_field("new_peep")
  end

  scenario 'Creates a new peep' do
    sign_up_correctly
    write_peep
    expect{ click_button("Submit") }.to change{ Peep.count }.by 1
  end

end
