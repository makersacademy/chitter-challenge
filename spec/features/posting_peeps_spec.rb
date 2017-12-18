feature 'Posting peeps' do

  before :each do
    sign_up
  end

  scenario "user should be able to post peeps" do
    peep_first

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content "I am posting my first peep"
    end
  end

  scenario "peep should appear reverse chronological order" do
    peep_first
    peep_second
    expect("This is my second peep").to appear_before "I am posting my first peep"
  end

  scenario "should be able to see a timestamp" do
    peep_first
    timestamp = Time.new.strftime("%A, %d %b %Y at %l:%M %p")
    within 'ul#peeps' do
      expect(page).to have_content "#{timestamp}"
    end
  end
end
