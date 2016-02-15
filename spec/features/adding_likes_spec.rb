
feature 'Adding Likes' do

  scenario 'updates the number of likes on the peep' do

    double_sign_up_with_peep
    click_button('Like')
    within('.likes') do
      expect(page).to have_content('1')
    end
    expect(Peep.first.likes).to eq(1)
  end

end
