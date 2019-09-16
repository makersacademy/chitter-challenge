feature '#user' do
  scenario 'create new user' do
    drop_test_database
    populate_test_database
    visit '/'
    click_button('add_user')
    fill_in :name, with: 'Test_user'
    fill_in :email, with: 'test@email.com'
    click_button('Submit')
    expect(User.all[3].name).to eq("Test_user")
    expect(User.all[3].email).to eq("test@email.com")
  end
end
