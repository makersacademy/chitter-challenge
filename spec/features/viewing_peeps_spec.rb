feature 'viewing peeps' do
  scenario 'peeps visible when not logged in' do
    User.create(name: 'test1', email: 'test1@test.com',
      username: 'testname1', password: 'Test111')

    Peep.create(content: 'Building Chitter', user_id: 1)
    Peep.create(content: 'Taking a break', user_id: 1)
    Peep.create(content: 'Writing tests', user_id: 1)

    visit '/peeps'

    expect(page).not_to have_content 'Hello test1!'
    expect(page).to have_button 'Sign In'
    expect(page).to have_content 'Building Chitter'
    expect(page).to have_content 'Taking a break'
    expect(page).to have_content 'Writing tests'
  end

  scenario 'username and name of poster is displayed' do
    sign_up_and_get_peeping

    click_button 'Peep'
    fill_in('peep', with: 'Building Chitter')
    click_button 'Post'

    expect(first('.peep')).to have_content 'test_name'
    expect(first('.peep')).to have_content 'test'
    expect(first('.peep')).to have_content 'Building Chitter'
    expect(current_path).to eq '/peeps'
  end
end
