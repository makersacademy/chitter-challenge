feature "reply to peeps" do
  scenario 'users can reply to other users peeps' do
    sign_in
    peep "General asembly for life"
    peep_id_1 = Peep.first(content: "General asembly for life").id
    sign_in "ferg", "ferg@gmail.com"
    peep "Naaah Makers"
    peep_id_2 = Peep.first(content: "Naaah Makers").id
    within "article##{peep_id_1}" do
      find_button 'reply'
    end
    within "article##{peep_id_2}" do
      expect(page).not_to have_button 'reply'
    end
  end

  scenario 'replies show handle of initial peep' do
    sign_in
    peep "General asembly for life"
    peep_id_1 = Peep.first(content: "General asembly for life").id
    sign_in "ferg", "ferg@gmail.com"
    within "article##{peep_id_1}" do
      click_button 'reply'
    end
    expect(page).to have_content "original peep"
    expect(page).to have_content "General asembly for life"
    fill_in :content, with: "Naah GA sucks balls"
    click_button 'reply'
    peep_id_2 = Peep.first(content: "Naah GA sucks balls").id
    within "article##{peep_id_2}" do
      expect(page).to have_content "in response to MacDaNNy"
    end
  end
end
