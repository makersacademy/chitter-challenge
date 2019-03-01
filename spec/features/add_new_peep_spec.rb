feature 'adding new peeps' do
  scenario 'users can add a new peep and see it on the homepage' do
    clean_test_database
    create_first_peep
    expect(page).to have_content('just writing some peeps...')
  end

  scenario 'items appear in reverse chronological order' do
    clean_test_database
    create_first_peep
    click_button('Add Peep')
    fill_in 'chitter_user', with: 'Mark'
    fill_in 'new_chitter_message', with: 'writing another peep'
    click_button('Create Peep')
    expect(page.body.index('writing another peep') < page.body.index('just writing some peeps...')).to eq(true)
  end
end


# Timecop.freeze(specific_datetime) do
#   # fill out form
#   ...
#   # submit form
#   ...
#   expect(page).to have_content("created_at: #{specific_datetime.tos}") # format the specific_datetime as expected
# end
