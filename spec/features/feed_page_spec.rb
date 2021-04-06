feature 'Viewing peeps' do
  scenario 'shows all peeps' do
    create_new_user_and_write_a_peep
    expect(page).to have_content('Hello this is a peep')
    expect(page).to have_content('test')
    expect(page).to have_content('testing')
  end
end
