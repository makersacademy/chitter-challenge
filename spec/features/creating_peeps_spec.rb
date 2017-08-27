require_relative '../../app/app.rb'
require_relative '../../app/models/peep.rb'

feature 'Create a peep' do

  scenario 'write a peep using a form' do
    visit '/peeps'
    click_button("Write peep")
    fill_in('my_peep', with: 'Hello World')
    fill_in('username', with: 'frosty')
    fill_in('name', with: 'Olivia')
    expect(Peep).to receive(:create).with(content: 'Hello World', user_handle: 'frosty', name: 'Olivia')
    click_button("Peep")
  end
  

end
