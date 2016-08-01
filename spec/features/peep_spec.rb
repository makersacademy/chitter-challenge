require "timecop"

feature "Peeps" do
  before do
    sign_up
    visit '/sessions/new'
    fill_in :email, with: 'sam@makersacademy.com'
    fill_in :password, with: 's3cr3t'
    click_button 'Sign in'
  end

  scenario "I can post peeps" do
    create_peep("NSFW")

    expect(page).to have_content("NSFW")
  end

  scenario "I can see the time when a peep was posted" do
    Timecop.freeze do
      create_peep("SNFW")

      within(".peep .timestamp") do
        expect(page).to have_content DateTime.now.strftime("%c")
      end
    end
  end

  scenario "Peeps are displayed in reverse order" do
    create_peep("NSFW")

    Timecop.travel(DateTime.now + 1) do
      create_peep("Epic fail")
    end

    expect(page.all(".peep .content").map(&:text)).to eq(["Epic fail", "NSFW"])
  end

  def create_peep(message)
    visit "/"
    click_link "peep"

    fill_in :peep, with: message
    click_button "Submit"
  end
end
