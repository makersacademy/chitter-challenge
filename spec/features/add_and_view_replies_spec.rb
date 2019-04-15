feature 'Adding and viewing replies' do
  scenario 'a reply can be added to a peep' do

    user = User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')
    Peeps.create(message: 'Test', user_id: user.id)
    User.create(email: 'newtest@example.com', password: 'password123', name: 'Test2', username: 'Tester2')

    visit '/'
    click_button 'Sign In'
    fill_in(:email, with: 'newtest@example.com')
    fill_in(:password, with: 'password123')
    click_button 'Sign in'

    test_reply_with_tag

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'TestReply'
    expect(page).to have_content 'Test2'
    expect(page).to have_content 'Tester2'
  end
end
