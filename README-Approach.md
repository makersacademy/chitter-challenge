Approach to solving challenge
======

- Use user stories to write the first set of feature tests (which should fail). 
- Write a series of unit tests based on the client's requirements to ensure that all feature tests pass. 
- Refactor the code and ensure it conforms to the Travis style guide and SRP. 
- Submit a pull request. 


### User Stories

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

```
As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

### Order I'll build things in:
1. Post a peep
2. Display peeps in reverse chronological order
3. Sign up
4. Sign in
5. Sign out