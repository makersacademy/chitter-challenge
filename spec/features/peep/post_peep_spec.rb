require_relative '../helpers/session'
require_relative '../helpers/peep'
include SessionHelpers
include PeepHelpers

feature 'a user updates his status' do
  before(:each) do
      User.create(email: 'test@test.com',
                  password: 'test',
                  password_confirmation: 'test',
                  username: 'john78')
  end
  scenario 'writing a peep when logged in' do

    sign_in('test@test.com', 'test')
    expect(page).to have_content('Welcome, john78')
    write_peep('hello world')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.content).to eq('hello world')
  end

  scenario 'writing a peep when logged out' do

    visit('/')
    expect { write_peep }.to change(User, :count).by(0)
     expect(page).to have_content('You must be logged in to post a peep')
  end
end
