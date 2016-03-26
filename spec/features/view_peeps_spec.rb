feature "View peeps" do
  before do
    sign_up
    now = Time.parse("2016-03-26 14:58:20 +0000")
    allow(Time).to receive(:now).and_return(now)
    p Time.now
  end

  scenario "show peeps in reverse chronological order" do

    # Timecop.freeze(now) do
      post "I have an emo nephew."
      p Time.now
      # Timecop.travel(60 * 60) do
      #   post "I love flying!"
      # end

      # within "li:first-child" do
      #   expect(page).to have_content "I love flying!"
      #   expect(page).to have_content "at 14:59 26/03/2016"
      # end
      p Peep.last
      within "li:last-child" do
        expect(page).to have_content "I have an emo nephew."
        expect(page).to have_content "at 14:58 26/03/2016"
      end
    # end
  end
end
