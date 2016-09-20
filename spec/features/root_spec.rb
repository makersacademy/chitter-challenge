feature "Root route" do
  scenario "root route successfully redirects to the feed route" do
    visit '/'
    expect(current_path).to eq '/feed'
  end
end
