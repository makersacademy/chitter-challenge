feature 'User sees all of the peeps' do

  before(:each) do
    Peep.create(text: 'Hello cruel world',
                time: Time.now)
  end

  scenario 'when looking at the home page' do
    visit '/'
    expect(page).to have_content('Hello cruel world')
  end

end
