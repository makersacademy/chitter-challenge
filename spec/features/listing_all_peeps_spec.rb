feature 'Chitter homepage' do

  before(:each) do
    Peep.create message: 'My first peep',
                user_name: 'Sanjay Purswani',
                user_handle: 'sanjsanj'

    Peep.create message: "Bob's first peep",
                user_name: 'Bob Smith',
                user_handle: 'bob'
  end

  after(:each) do
    Peep.each(&:destroy)
  end

  scenario 'lists all peeps' do
    visit '/'
    expect(page).to have_content "My first peep"
    expect(page).to have_content "Bob's first peep"
  end

end
