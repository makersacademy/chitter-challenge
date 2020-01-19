require 'timecop'

feature 'See peeps in reverse chronological order' do
  before do 
    Chitter.create(peep: "Hi")
  end

  scenario 'See latest peep first' do
    visit('/')
    fill_in "peeps", with: "I'm Shaun"
    click_button "Tweet"
    Timecop.freeze(Time.now)
    expect(current_path).to eq "/peeps"

    expect(page).to have_content "I'm Shaun"
    # expect(page).to have_content Time.now.to_s
  end
end
