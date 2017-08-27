require_relative '../../app/app.rb'
require_relative '../../app/models/peep.rb'

feature 'Create a peep' do

  scenario 'write a peep using a form' do
    visit '/peeps'
    click_button("Write peep")
    fill_in('name', with: "Olivia")
    fill_in('email', with: "o@makers.com")
    fill_in('username', with: "frosty")
    fill_in('password', with: "olivia")
    expect(User).to receive(:create).with(name: 'Olivia', username: 'frosty', email: 'o@makers.com', password: 'olivia')
    click_button("Complete Signup")
    fill_in('my_peep', with: 'Hello World')
    expect(Peep).to receive(:create).with(content: 'Hello World')
    click_button("Peep")
  end
  

end