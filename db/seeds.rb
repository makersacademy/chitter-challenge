User.create id: 1, 
            username: 'Sam', 
            password: '1234icecream', 
            email: 'sam@example.com'
User.create id: 2, 
            username: 'Not Sam', 
            password: '4321noticecream', 
            email: 'notsam@example.com'
User.create id: 3, 
            username: 'Ms. Ruby', 
            password: 'rubyrubyrubyruby', 
            email: 'msruby@example.com'
User.create id: 4, 
            username: 'ActiveRecordBot', 
            password: '0101binary', 
            email: 'bot@activerecord.com'
User.create id: 5, 
            username: 'Frank Sinatra', 
            password: 'ididitmyway', 
            email: 'frank@franksinatra.com'

Peep.create id: 1, 
            body: 'My first tweet! I mean, my first peep!', 
            user_id: 1

Peep.create id: 2, 
            body: "Something something politics. Sad.", 
            user_id: 2

Peep.create id: 3, 
            body: "Hope everyone's having an excellent day!", 
            user_id: 3

Peep.create id: 4, 
            body: "It's always your birthday this year if you were born on the 31st of Dece" + 
            "mber. It's rarely your birthday if you were born on February 29th.", 
            user_id: 4

Peep.create id: 5, 
            body: "I'm a bit of a shock at first, but after a while I promise you'll warm up to " + 
            "me – did someone say 'no initialize methods'? No? Okay.", 
            user_id: 4

Peep.create id: 6, 
            body: "You go to my head.. and you linger like a haunting refrain.. and I find " + 
            "you spinning round in my brain.. like the bubbles in a glass " + 
            "of champagne..", 
            user_id: 5

Peep.create id: 7, 
            body: "Off to buy a new rake for all these seeds.. Get it? 'rake'..? " + 
            "'seeds'..? You're welcome.", 
            user_id: 1

Peep.create id: 8, 
            body: "Hello all, I'm back with yet more unsolicited opinions. Here's what I think " + 
            "about universal basic income (a thread):", 
            user_id: 2
            
Peep.create id: 9, 
            body: 'Ruby Tuesdays! Love Tuesdays, I do.', 
            user_id: 3

Peep.create id: 10, 
            body: "That's life, that's what people say; you're riding high in April, shot " + 
            "down in May...", 
            user_id: 5

Peep.create id: 11, 
            body: "Isn't it funny how we've all peeped these messages at the exact " + 
            "same time..?", 
            user_id: 4

Peep.create id: 12, 
            body: "Something something shakily understood economics. " + 
            "Please like my peep.", 
            user_id: 2

Peep.create id: 13, 
            body: "A lot can happen in a year..!", 
            user_id: 3

Peep.create id: 14, 
            body: "I think I get it now, this is like twitter, but for cool people.", 
            user_id: 1

Peep.create id: 15, 
            body: 'Fly me to the moon...', 
            user_id: 5

Luv.create id: 1, user_id: 1, peep_id: 14
Luv.create id: 2, user_id: 2, peep_id: 6
Luv.create id: 3, user_id: 3, peep_id: 2
Luv.create id: 4, user_id: 5, peep_id: 4
Luv.create id: 5, user_id: 4, peep_id: 4
Luv.create id: 6, user_id: 5, peep_id: 4
Luv.create id: 7, user_id: 3, peep_id: 1
Luv.create id: 8, user_id: 4, peep_id: 6
Luv.create id: 9, user_id: 1, peep_id: 5
Luv.create id: 10, user_id: 2, peep_id: 5
Luv.create id: 11, user_id: 3, peep_id: 13
Luv.create id: 12, user_id: 2, peep_id: 11
Luv.create id: 13, user_id: 5, peep_id: 8
Luv.create id: 14, user_id: 4, peep_id: 8
Luv.create id: 15, user_id: 1, peep_id: 7
Luv.create id: 16, user_id: 3, peep_id: 4
Luv.create id: 17, user_id: 1, peep_id: 12
Luv.create id: 18, user_id: 2, peep_id: 12
Luv.create id: 19, user_id: 4, peep_id: 10
Luv.create id: 20, user_id: 5, peep_id: 10
Luv.create id: 21, user_id: 3, peep_id: 1
Luv.create id: 22, user_id: 4, peep_id: 1
Luv.create id: 23, user_id: 1, peep_id: 14
Luv.create id: 24, user_id: 2, peep_id: 6
Luv.create id: 25, user_id: 3, peep_id: 13
Luv.create id: 26, user_id: 3, peep_id: 2
Luv.create id: 27, user_id: 4, peep_id: 7
Luv.create id: 28, user_id: 1, peep_id: 8
Luv.create id: 29, user_id: 2, peep_id: 5
Luv.create id: 30, user_id: 3, peep_id: 13
Luv.create id: 31, user_id: 2, peep_id: 11
Luv.create id: 32, user_id: 5, peep_id: 4
Luv.create id: 33, user_id: 4, peep_id: 11
