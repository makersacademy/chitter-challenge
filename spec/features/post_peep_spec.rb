# USER STORY
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting Peeps' do

  scenario 'I can post a single peep' do
  @peep = "Joffrey...Cersei...Walder Frey...Meryn Trant...Tywin Lannister...The Red Woman...Beric Dondarrion...Thoros of Myr...Illyn Payne...The Mountain.."

  visit '/peeps/new'
  expect(page.status_code).to eq 200
  fill_in :message, with: @peep
  click_button 'Post'
  expect(page).to have_content @peep
  end
end
