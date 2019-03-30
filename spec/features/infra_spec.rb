describe "Infrastructure" do
  it "tests infra is up and running" do
    visit "/"
    expect(page).to have_content "Infrastructure working"
  end
end