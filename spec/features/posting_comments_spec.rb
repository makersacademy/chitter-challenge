require 'spec_helper'

feature 'User posting comments' do

  scenario 'cant comment on existing post if not signed in' do
    sign_in_and_peep
    click_button 'Sign out'

    within 'div.comments' do
      expect(page).not_to have_button 'reply'
      expect(page).not_to have_css "textarea"
    end
  end

  scenario 'can see a comment area when there is a peep' do
    sign_in_and_peep

    within 'div.comments' do
      expect(page).to have_button 'reply'
      expect(page).to have_css "textarea"
    end
  end

  scenario 'can post a comment on a peep' do
    sign_in_and_peep

    expect { comment('hey hou') }.to change(Comment, :count).by(1)

    within 'div.comments' do
      expect(page).to have_content 'hey hou'
    end
  end

  scenario 'can see the date and time when comment was posted' do
    sign_in_and_peep
    comment('hey hou')

    within 'div.comment' do
      expect(page).to have_content(Time.now.strftime("%Y-%m-%d %H:%M"))
    end
  end

  scenario 'cannot post an empty peep' do
    sign_in_and_peep
    expect{ comment('') }.not_to change(Comment, :count)
    expect(page).to have_content "Please enter some text"
  end

end
