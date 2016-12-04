feature "Peeps homepage" do

  let!(:peep) {"Bacon ipsum dolor amet pig bacon porchetta tail,
              pork loin pastrami shoulder t-bone chuck. Chicken
              ribeye chuck cow, beef flank shoulder fatback pig."}

  scenario "a user can write a peep" do

    sign_up
    correct_log_in
    fill_in 'user_message', :with => peep
    click_button('peep')
    expect(page).to have_content(peep)
    expect{peep}.to change{Peep.count}.by 1

  end
end
