feature 'Viewing links' do

  scenario 'i can see exisiting links on the links page' do
    Peep.create(peeps: 'this is a test', time: '22/10/15 10:59am')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content 'this is a test'
    end
  end
end