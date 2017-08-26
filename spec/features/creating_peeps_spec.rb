feature 'Create a peep' do

  scenario 'write a peep using a form' do
    visit '/chitter'
    click_button("Write peep")
    fill_in('my_peep', with: 'Hello World')
    fill_in('my_name', with: 'Olivia')
    expect(Peep).to receive(:create).with(peep: 'Hello World', username)

end
