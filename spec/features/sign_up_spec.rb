feature 'signup' do
  scenario 'a user can sign up for chitter' do
    visit('/users/new')
    fill_in('first name',with: 'John')
    fill_in('last name',with: 'Doe')
    fill_in('email address',with: 'johndoe@gmail.com')
    click_button('Submit')

    expect(page).to have_text('Congratulations John Doe, you have signed up for Chitter!')
  end
end
