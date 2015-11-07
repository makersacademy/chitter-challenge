# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario 'sign up with email, password, name and user name' do
    visit ('/')
    expect(page.status_code).to eq(200)
    fill_in :email, with: 'amy@awesome.com'
    fill_in :password, with: 'apple'
    fill_in :name, with: 'Amy Yang'
    fill_in :user_name, with: 'Mongolian Princess'
    click_button('Sign up')
    expect(User.count).to eq(1)
    expect(User.first.email).to eq 'amy@awesome.com'
  end
end
