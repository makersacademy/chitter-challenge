feature "infrastructure" do
  it "/ responds with 200" do
    visit "/"
    expect(page.status_code).to eq 200
  end
end
