feature 'authentication' do
  it 'a user can sign in' do
    create_account
    visit '/'
    fill_in(:email, with: 'caesar@conures.com')
    fill_in(:password, with: 'parrots1')
    click_button('Go')

    expect(page).to have_content 'Welcome, Caesar'
  end
end
