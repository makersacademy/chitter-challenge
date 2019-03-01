feature 'adding new peeps' do
  scenario 'users can add a new peep and see it on the homepage' do
    clean_test_database
    create_first_peep
    expect(page).to have_content('just writing some peeps...')
  end
end
