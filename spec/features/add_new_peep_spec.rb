feature 'adding new peeps' do
  scenario 'users can add a new peep and see it on the homepage' do
    clean_test_database
    create_test_account
    create_first_peep
    expect(page).to have_content('just writing some peeps...')
  end

  scenario 'items appear in reverse chronological order' do
    Timecop.freeze(Time.now - 30)
    clean_test_database
    create_first_peep
    visit('/')
    Timecop.return
    click_button('Add Peep')
    fill_in 'new_chitter_message', with: 'writing another peep'
    click_button('Create Peep')
    p page.body.index('writing another peep')
    p page.body.index('just writing some peeps...')
    expect('writing another peep').to appear_before('just writing some peeps...')
  end

  scenario 'users can see the time at which a peep was created' do
    clean_test_database
    test_time = Time.local(2008, 9, 1, 10, 5, 0)
    Timecop.freeze(test_time)
    visit('/')
    click_button('Add Peep')
    fill_in 'new_chitter_message', with: 'Time testing peep'
    click_button('Create Peep')
    expect(page).to have_content('Time testing peep Gary at 2008-09-01 10:05:00')
  end
end
