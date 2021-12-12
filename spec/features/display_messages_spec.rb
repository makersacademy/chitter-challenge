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
    
    expect(page).to have_content("Hi mom again! - Test - #{@time_now} Hi mom - Test - #{@time_now}")
  end

  scenario  "timestamp displayed for message" do
    sign_up_test_account

    fill_in(:message, with: "Hi mom")
    click_button("Chitter")
    
    expect(page).to have_content("Hi mom - Test - #{@time_now}")
  end
end
