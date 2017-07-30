def post_a_peep(test_peep)
peep = test_peep
visit '/peeps/new'
fill_in :message, with: peep
click_button 'Post'
end

def test_peep_one
  "Joffrey...Cersei...Walder Frey...Meryn Trant...Tywin Lannister...The Red Woman...Beric Dondarrion...Thoros of Myr...Illyn Payne...The Mountain.."
end

def test_peep_two
  "No need to seize the last word, Lord Baelish. I'll assume it was something clever"
end

def sign_up

end
