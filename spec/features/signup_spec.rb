feature 'Sign Up' do

  scenario 'registers users details when signing up' do
    #require 'pry'
    #binding.pry
  expect { sign_up}.to change(User, :count).by(1)
  expect(User.first.email).to eq('b@ttle.com')
  end
end
