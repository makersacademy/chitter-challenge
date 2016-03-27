feature "View peeps" do
  before do
    sign_up

    earlier = Time.parse("2016-03-26 14:58:20 +0000")
    allow(Time).to receive(:now).and_return(earlier)
    post "I have an emo nephew."

    later = Time.parse("2016-03-26 14:59:20 +0000")
    allow(Time).to receive(:now).and_return(later)
    post "I love flying!"
  end

  scenario "show peeps in reverse chronological order" do
    within "ul li.peep:first-child" do
      expect(page).to have_content "I love flying!"
      expect(page).to have_content "14:59 26/03/2016"
    end

    within "ul li.peep:last-child" do
      expect(page).to have_content "I have an emo nephew."
      expect(page).to have_content "14:58 26/03/2016"
    end
  end
end
