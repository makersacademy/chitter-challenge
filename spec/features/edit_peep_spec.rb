feature 'edit a peep' do
  scenario 'a user wants to edit a peep that has already been posted' do
    peep_1 = Peep.create(text: "peep test 1", username: "user_1")
    peep_2 = Peep.create(text: "peep test 2", username: "user_2")

    visit('/peeps/show')

    within "#peep-#{peep_1.id}" do
      click_button 'Edit'
    end

    fill_in('text', with: 'peep test 21')
    click_button('Submit')

    expect(page).not_to have_content "peep test 1"
    expect(page).to have_content "peep test 2"
    expect(page).to have_content "peep test 21"
  end
end
