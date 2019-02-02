- Had to add 'require sinatra' to spec_helper in order to get it to respect environment variables.
    - Need to understand this better - why is it no needed to run the tests?
        - Am I initialising it twice?
- Investigate 'persisted data' here: https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/18.md
- How to stub database calls using Active Record? E.g. in unit testing the Peep class, need a user ID, but manually feeding one 
violates the foreign key constraint, as no user ID exists. Had to require 'user' in the end...