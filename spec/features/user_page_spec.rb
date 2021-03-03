feature 'user account peeps page' do
  scenario 'shows only the user peeps' do
    user2 = User.create(name: 'test2', email: 'test2@test.com', username: 'testname2', password: 'Test222')
    Peep.create(content: 'Other person peep', user_id: user2.id)

    sign_up_and_get_peeping

    click_button 'Peep'
    fill_in('peep', with: 'Building Chitter')
    click_button 'Post'

    click_button 'Peep'
    fill_in('peep', with: 'Writing tests')
    click_button 'Post'

    expect(page).to have_content 'Other person peep'

    click_button 'My Peeps'

    expect(page).to have_content 'Building Chitter'
    expect(page).to have_content 'Writing tests'
    expect(page).not_to have_content 'Other person peep'
  end
end
