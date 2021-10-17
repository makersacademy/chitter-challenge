feature 'Viewing peeps' do
  scenario 'User can see all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec_params("INSERT INTO peeps (content, posttime, author_id) VALUES ('Test peep 1', current_timestamp, 1)");
    connection.exec_params("INSERT INTO peeps (content, posttime, author_id) VALUES ('Test peep 2', current_timestamp, 1)");
    connection.exec_params("INSERT INTO peeps (content, posttime, author_id) VALUES ('Test peep 3', current_timestamp, 1)");

    visit '/peeps'

    expect(page).to have_content('Test peep 1')
    expect(page).to have_content('Test peep 2')
    expect(page).to have_content('Test peep 3')
  end
end



feature 'User can add a peep' do
  scenario 'User can add a new peep on the new peep page' do
    go_to_new_peep_page
    fill_in('content', with: 'This is my first peep')
    click_button('Peep It')
    expect(page).to have_content('This is my first peep')
  end
end
