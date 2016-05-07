

feature 'viewing peeps' do
  scenario 'peeps in reverse chronological order' do
    sign_in
    peep "Cats are the best"
    peep "I love horses"
    within "ul#peeps" do
      expect("I love horses").to appear_before "Cats are the best"
    end
  end
end
