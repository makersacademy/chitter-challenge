feature 'Signing up' do
  scenario 'A Maker can sign up for Chitter' do
    visit('/peeps')
    click_button('Sign up')
    fill_in('email', with: 'samantha@test.com')
    fill_in('password', with: 'Test123')
    fill_in('username', with: 'samanthatest')
    fill_in('name', with: 'Samantha Test')
    click_button('Submit')

    expect(page.current_path).to eq('/peeps')
    expect(page).to have_content('Peeps:')
  end
end
