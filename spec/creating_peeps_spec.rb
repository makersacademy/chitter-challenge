require_relative './helpers/web_helper.rb'

feature 'creating peep' do
  scenario 'I will be able to create a peep' do
    create_peep
  end

  before(:each) do
    Peep.create(title: 'First Peep', text: 'Some Text')
    Peep.create(title: 'Second Peep', text: 'Some Text')
    Peep.create(title: 'Third Peep', text: 'Some Text')
    Peep.create(title: 'Fourth Peep', text: 'Some Text')
  end

  scenario 'I will be able to see the time the peep was created' do
    create_peep
    expect(page).to have_content('created_at:')
  end
end
