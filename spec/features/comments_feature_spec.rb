require 'spec_helper'
require 'timecop'

feature 'Peep replies' do

  scenario 'I can reply to a peep with a comment' do
    comment_on_peep
    expect(page).to have_css("div.single_peep")
    expect(page).to have_content 'Here\'s a comment'
    expect(current_path).to eq '/chitter'
  end

  scenario 'comments are stored in the database' do
    expect{comment_on_peep}.to change(Comment, :count)


  end


  context 'Date and time stamps' do
    before do
      Timecop.freeze(Time.local(1990, 1, 2, 13, 05))
    end

    after do
      Timecop.return
    end

    scenario 'I can see who has commented on peeps and when' do
      comment_on_peep
      expect(page).to have_content '1:05PM'
      expect(page).to have_content '01/02/1990'
      expect(page).to have_content 'Kokokitscha'
    end

    scenario 'I can see comments under their peeps in chronological order' do
      comment_on_peep
      expect(page).to have_content '1:05PM'
      expect(page).to have_content '01/02/1990'
      expect(page).to have_content 'Kokokitscha'
    end
  end
end
