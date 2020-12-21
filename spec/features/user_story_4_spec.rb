feature 'So that I can post messages on Chitter as me,' do
  scenario 'I want to sign up for Chitter' do
    visit('/users/new')
    fill_in('user_name', with: 'User 1')
    click_button('Submit')
    expect(page).not_to have_content 'Sinatra'
    expect(current_path).to have_content '/users/'
    expect(page).to have_content "Hi, User 1!"
    click_button('First Peep')
    fill_in('message', with: 'Test message')
    click_button('Peep')
    expect(first('.peep')).to have_content 'User 1'
  end
end
