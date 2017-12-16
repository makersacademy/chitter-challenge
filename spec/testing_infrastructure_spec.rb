feature "Visiting webpage" do
  scenario "I can visit Chitter's webpage" do
    visit('/peeps')
    expect(page.status_code).to eq(200)
  end
end
