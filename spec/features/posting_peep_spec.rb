feature "Posting Peep" do
  scenario "Submitting typed text appears" do
    visit ("/")
    fill_in "content", with: "My first peep"
    puts "ENV"
    puts ENV['RACK_ENV']
    click_button "Submit"
    expect(page).to have_content "My first peep"
  end

  scenario "all posted peeps show" do 
    Peep.create(content: "hello")
    Peep.create(content: "I should be here too")
    visit '/'
    expect(page).to have_content "hello"
    expect(page).to have_content "I should be here too"
  end
  
  scenario "reverse chronological order" do
  end
  
  
end