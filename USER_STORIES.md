
### STRAIGHT UP
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
| Objects  | Messages |
| ------------- | ------------- |
| Peep  | #text, .create |


```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
| Objects  | Messages |
| ------------- | ------------- |
| Peep  | #text, .create, .all, #id |

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

| Objects  | Messages |
| ------------- | ------------- |
| Peep  | #text, .all, .create, #id, #time |

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

| Objects  | Messages |
| ------------- | ------------- |
| Peep  | #text, .all, .create, #id, #time |
| User | #id, #username, #password, .find |

### Notes 
* Probably want to show username on peep, but not actually explicitly requested as feature
* Not asked to update or delete peeps
* Peep has a user, user has many peeps
* Let's use DataMapper



### HARDER

```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
### ADVANCED
```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```