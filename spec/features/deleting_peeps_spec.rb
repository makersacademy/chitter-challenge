feature 'Deleting peeps' do
  # as a social media user
  # so i can remove peeps from my peep feed
  # i want to delete a peep
  scenario 'A user can delete a peep' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (text) VALUES ('apples are green');")

    visit('/peeps')
    expect(page).to have_content('apples are green')
    first('.peep').click_button('Delete')
    expect(current_path).to eq('/peeps')
    expect(page).not_to have_content('apples are green')
  end
end
