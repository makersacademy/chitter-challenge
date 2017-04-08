require_relative '../../app/models/user'

feature 'signing up users' do
  scenario 'user signs up' do
    expect{signup}.to change(User, :count).by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome to Knitter, happyfriends@treehouse.com'
  end
end
