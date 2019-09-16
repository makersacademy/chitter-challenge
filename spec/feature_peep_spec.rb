feature '#peeps' do
  scenario 'view' do
    drop_test_database
    populate_test_database
    visit '/'
    click_button('view_peeps')
    expect(page).to have_content('Volker')
    expect(page).to have_content('Test1')
    expect(page).to have_content('Volker3')
    expect(page).to have_content('Test3')
  end
  scenario 'post peep' do
    drop_test_database
    populate_test_database
    visit '/'
    click_button('select_user')
    choose(1)
    click_button('Submit')
    click_button('post_peep')
    fill_in :text, with: 'Test_inserted'
    click_button('Submit')
    click_button('view_peeps')
    expect(page).to have_content('Test_inserted')
  end
end
