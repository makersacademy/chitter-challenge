feature 'User browses the list of peeps' do

  before(:each) do
    Message.create(peep: 'Hello, Chatter',
                username: 'CurlyGirly')
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('CurlyGirly')
  end
end

