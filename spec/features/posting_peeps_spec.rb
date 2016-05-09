feature 'posting peeps' do
  scenario 'users can create peeps' do
    sign_in
    visit '/peep'
    fill_in :content, with: "My life is sooooo interesting"
    expect{click_button 'peep'}.to change(Peep, :count).by 1
  end

  scenario "non-users can't" do
    visit '/peep'
    fill_in :content, with: "Look at my dinner...."
    expect{click_button 'peep'}.not_to change(Peep, :count)
    expect(page).to have_content "only users can peep"
    expect(current_path).to eq "/peep"
    expect(find_field('content').value).to eq "Look at my dinner...."

  end

  scenario "max peep length of 144 chars" do
    peep_message = 'p' * 144
    too_long_message = 'p' * 145
    sign_in
    expect{peep peep_message}.to change(Peep, :count).by 1
    expect{peep too_long_message}.not_to change(Peep, :count)
    expect(page).to have_content "your peep is too long"
  end
end
