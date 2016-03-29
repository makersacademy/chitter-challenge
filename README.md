CHITTER

Summary

Chitter is a twitter clone where users can read and write peeps!
Access to my Chitter is availible at https://ultimate-chitter.herokuapp.com/

Installation

1. The user model was created enabling users to signup, signin and signout of Chitter.
2. Every user must enter a unique and valid email address and username to sign up. This was implemented using validations.
3. The peep model was created to allow users to post peeps.
4. A many to one relationship between a user and peeps was created requiring every peep to belong to a user and every user to post multiple peeps.
5. Guests are allowed to see peeps however cannot post a peep as a peep should belong to a registered user.


Usage

1. https://ultimate-chitter.herokuapp.com/
2. To continue as a guest please click 'Guest'. This will enable you to see user peeps but not post peeps.
3. To sign up please click 'Sign Up'.
4. Enter your details ensuring your username and email are valid and unique, and your passwords match.
5. Click 'Sign Up'.
6. Once you have successfully signed up you will be redirected to the Peeps homepage.
7. To sign in simply click 'Sign In' and enter your credentials.
8. To post a peep, enter your message and click 'Post peep'.
9. To logout click 'Log Out'