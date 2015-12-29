# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario 'the user signs up to Chitter' do
    visit '/'
    click_button('Sign up')
    fill_in(name: 'Camilla', email: 'camillacolser@hotmail.com', password: 'apple')
    click_button('Sign up!')
    expect(page.status_code).to eq 200
    expect(page).to have_content('')
  end
end
