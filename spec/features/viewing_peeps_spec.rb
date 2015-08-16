feature 'Viewing Peeps' do
  context 'when on homepage' do
    scenario "users see peeps' content" do
      create(:peep, content: "First Peep")
      create(:peep, content: "Second Peep")
      create(:peep, content: "Third Peep")
      visit '/'
      expect(page).to have_content "First Peep"
      expect(page).to have_content "Second Peep"
      expect(page).to have_content "Third Peep"
    end

    scenario 'peeps show when created' do
      time = Time.now
      formatted_time_stamp = time.ctime
      puts formatted_time_stamp
      peep = create(:peep, created_at: time)

      visit '/'
      expect(page).to have_content(formatted_time_stamp)
    end
  end
end