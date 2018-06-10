feature 'delete a peep' do
  scenario 'a user can delete a peep from the page' do
    peep_1 = Peep.create(text: "peep test 1", username: "user_1")
    peep_2 = Peep.create(text: "peep test 2", username: "user_2")

    visit('/peeps/show')

    within "#peep-#{peep_1.id}" do
      click_button 'Delete'
    end

    expect(page).not_to have_content "peep test 1"
    expect(page).to have_content "peep test 2"
  end
end
