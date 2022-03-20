# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign Up' do
  scenario 'User can sign up' do
    visit('/')
    click_link(text: 'Sign Up', href: '/signup')
    fill_in(name: 'full_name', with: 'Name Test')
    fill_in(name: 'username', with: 'Test')
    fill_in(name: 'email', with: 'test@test.com')
    fill_in(name: 'password', with: 'testing123')
    click_button(id: 'submit', value: 'Sign Up')
    expect(page.current_path).to eq('/')
  end
end