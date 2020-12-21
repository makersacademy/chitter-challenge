feature 'So that I can post messages on Chitter as me,' do
  scenario 'I want to sign up for Chitter' do
    visit('/users/new')
    fill_in('user_name', with: 'User 1')
    click_button('Submit')
    expect(page).not_to have_content 'Sinatra'
    expect(current_path).to eq '/users/*'
    expect(page).to have_content "Welcome to Chitter, User 1!"
    click_button('Fist Peep')
  end
end
