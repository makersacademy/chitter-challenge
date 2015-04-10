feature 'When visiting the homepage' do
  before(:each) do
    Peep.create message: 'My first peep',
                user_name: 'Sanjay Purswani',
                user_handle: 'sanjsanj'
  end

  after(:each) do
    Peep.each(&:destroy)
  end

  scenario 'view peeps' do
    visit '/'
    expect(page).to have_content 'My first peep'
  end
end
