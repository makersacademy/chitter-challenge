require 'timecop'

feature "display messages" do
  before do
    Timecop.freeze
    @time_now = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end

  scenario "messages show in reverse chronological order" do
    sign_up_test_account

    fill_in(:message, with: "Hi mom")
    click_button("Chitter")
    fill_in(:message, with: "Hi mom again!")
    click_button("Chitter")
    
    expect(page).to have_content("Hi mom again! Test Test - Test #{@time_now} Hi mom Test Test - Test #{@time_now}")
  end

  scenario "message, timestamp, name, and username displayed for message" do
    sign_up_test_account

    fill_in(:message, with: "Hi mom")
    click_button("Chitter")
    
    expect(page).to have_content("Hi mom")
    expect(page).to have_content("Test Test")
    expect(page).to have_content("Test")
    expect(page).to have_content(@time_now)
  end
end
