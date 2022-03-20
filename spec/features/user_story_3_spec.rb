# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'timestamp' do
  let(:timestamp) { double(:timestamp, strftime: '31/12/2022 - 14:04') } 
  scenario 'timestamp visible on peeps' do
    visit('/')
    allow_any_instance_of(Peep).to receive(:created_at).and_return(timestamp)
    click_link(text: 'New Peep', href: '/new_peep')
    fill_in(name: 'peep_text', with: 'This is a test peep.')
    click_button(id: 'submit', value: 'Add Peep')
    expect(page.find('li:nth-child(1)')).to have_content '31/12/2022 - 14:04'
  end
end