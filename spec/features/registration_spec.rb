feature 'registration' do
  scenario 'a user can sign up' do
    visit '/maker/new'
    fill_in('name', with: 'Jack Stormy')
    fill_in('email', with: 'jack@gmail.com')
    click_button('Submit')

    expect(page).to have_content 'Welcome to your feed Jack'
  end
end