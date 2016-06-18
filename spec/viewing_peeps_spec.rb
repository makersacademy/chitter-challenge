feature 'Viewing peeps' do
  scenario "I can see existing peeps on the peep page" do
  	Peep.create(peep: 'This is a test peep')
  	visit '/peeps'
  	expect(page.status_code).to eq 200
  	within 'ul#peeps' do
  	  expect(page).to have_content('This is a test peep')
  	end
  end
end