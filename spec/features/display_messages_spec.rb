feature "display messages" do
  before do
    @time_now = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    allow_any_instance_of(Time).to receive(:now).and_return('bread') # FIX STUBBING OF TIME
  end

  scenario "messages show in reverse chronological order" do
    visit("/")
    fill_in(:message, with: "Hi mom")
    click_button("Chitter")
    fill_in(:message, with: "Hi mom again!")
    click_button("Chitter")
    
    expect(page).to have_content("Hi mom again! - #{@time_now } Hi mom - #{@time_now}")
  end

  scenario  "timestamp displayed for message" do
    visit("/")
    fill_in(:message, with: "Hi mom")
    click_button("Chitter")
    time = Time.now.strftime("%Y-%m-%d %H:%M")
    
    expect(page).to have_content("Hi mom - #{@time_now }")
  end
end
