feature 'signing up' do
  scenario 'page displays to sign up field' do
    visit('/')
    expect(page).to have_css('#email')
    expect(page).to have_css('#password')
    expect(page).to have_css('#name')
    expect(page).to have_css('#username')
  end

  # scenario 'user can sign up with email, password, name and a username' do
  #   visit('/')
  #   fill_in('email', with: 'example@example.com')
  #   fill_in('password', with: 'Password123')
  #   fill_in('name', with: 'Wash')
  #   fill_in('username', with: 'Leafonthewind')
  # end
end
