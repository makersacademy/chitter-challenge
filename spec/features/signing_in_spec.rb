# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'signing up to chitter' do

  scenario 'I can sign up' do
    visit('/users/new')
    expect(page.status_code).to eq 200
    fill_in(:name, with: 'Chris')
    fill_in(:username, with: 'Wynndow')
    fill_in(:email, with: 'chris.wynndow@gmail.com')
    fill_in(:password, with: 'password')
    expect{click_button('Sign up')}.to change{ User.count }.by(1)
    expect(User.first.username).to eq 'Wynndow'
  end

end
