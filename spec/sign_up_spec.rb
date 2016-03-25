
feature 'signing up' do

  scenario 'a new user signs up' do
    visit '/'
    click_link('Sign up')
    fill_in :email, with: 'bob@bob.com'
    fill_in :password, with: 'password1'
    fill_in :name, with: 'bob'
    fill_in :username, with: 'bobcat'
    expect{ click_button('Submit') }.to change{ User.all.count }.by(1)
  end
end
