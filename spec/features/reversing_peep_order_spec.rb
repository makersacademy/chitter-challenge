# frozen_string_literal: true

feature 'reversing the order of the peeps' do

  scenario 'A user can view the newest peep first' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Jane Doe')
    fill_in('username', with: '@username')
    click_button('Submit')
    fill_in('text', with: '1st peep')
    click_button('Submit')
    fill_in('text', with: '2nd peep')
    click_button('Submit')

    expect(page).to have_content('2nd peep')
    expect(page).to have_content('1st peep')
  end

end
