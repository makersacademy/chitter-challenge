require 'timecop'

feature 'See peeps in reverse chronological order' do
  scenario 'See latest peep first' do
    Timecop.freeze(Time.now) do
      sign_up
      fill_in "peeps", with: "I'm Shaun"
      click_button "Tweet"
      expect(current_path).to eq "/peeps"
      expect(page).to have_content "I'm Shaun"
      # expect(page).to have_content (Time.now.strftime('%Y-%m-%d %H:%M:%s')).to_s
    end
  end
end
