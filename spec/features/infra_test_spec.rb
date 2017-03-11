feature "Root page" do

  scenario "Infra check" do
    visit('/')
    expect(page).to have_content "Hello World"
  end

end
