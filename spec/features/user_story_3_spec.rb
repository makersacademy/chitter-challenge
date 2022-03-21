# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'timestamp' do
  let(:timestamp) { double(:timestamp, strftime: '31/12/2022 - 14:04') } 
  scenario 'timestamp visible on peeps' do
    visit('/')
    allow_any_instance_of(Peep).to receive(:created_at).and_return(timestamp)
    add_peep('This is a test peep.')
    expect(page.find('li:nth-child(1)')).to have_content '31/12/2022 - 14:04'
  end
end