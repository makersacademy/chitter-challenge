feature 'view all peeps' do
  scenario 'a user can see all of the peeps' do
    peep_1 = Peep.create(text: "peep test 1", username: "user_1")

    visit('/peeps/show')

    expect(page).to have_content "peep test 1"
  end
end
