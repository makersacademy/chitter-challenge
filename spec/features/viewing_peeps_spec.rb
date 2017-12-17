feature "Viewing peeps" do
  before(:each) do
    sign_up
    post_a_peep("Hello!")
  end

  scenario "I can view all the peeps" do
    expect(page.current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content "Hello!"
      expect(page).to have_content "Posted at: #{Peep.first.created_at}"
    end
  end

  scenario "peeps contain users' name and username" do
      expect(page).to have_content 'Yan'
      expect(page).to have_content 'yanny'
  end
end
