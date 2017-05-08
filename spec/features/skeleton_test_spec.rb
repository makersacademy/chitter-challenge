feature "Skeleton Test" do
  scenario "Can access homepage" do
    visit '/'
    expect(page).to have_content "Hello World!"
  end
end
