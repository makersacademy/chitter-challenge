# Domain modelling

## CRC cards
Below are the initial CRC cards. Please notice that these do not represent the final design, rather the initial conceptualisation based on the user stories.

<table>
  <tr>
    <td colspan="2"><b>User</b></td>
  </tr>
  <tr>
    <td>Knows the user name&surname</td>
    <td></td>
  </tr>
  <tr>
    <td>Knows the user username</td>
    <td></td>
  </tr>
  <tr>
    <td>Knows the user email</td>
    <td></td>
  </tr>
  <tr>
    <td>Knows the user password</td>
    <td></td>
  </tr>
</table>

<table>
  <tr>
    <td colspan="2"><b>Message</b></td>
  </tr>
  <tr>
    <td>Knows the time at which it was created</td>
    <td>User</td>
  </tr>
  <tr>
    <td>Knows the user it belongs to</td>
    <td></td>
  </tr>
  <tr>
    <td>Knows the content of the message</td>
    <td></td>
  </tr>
</table>

## Database model

The following database tables are based on the models above.

<table>
  <tr>
    <td colspan="2"><b>Users</b></td>
  </tr>
  <tr>
    <td>id(pk)</td>
    <td>name</td>
    <td>surname</td>
    <td>email</td>
    <td>password_digest</td>
    <td>username</td>
  </tr>
  <tr>
    <td><i>1</i></td>
    <td><i>Andrea</i></td>
    <td><i>Mazzarella</i></td>
    <td><i>andrea@mazzarella.it</i></td>
    <td><i>dfo2f23fii9gjsodsflkj2</i></td>
    <td><i>andrea_lobster</i></td>
  </tr>
</table>

<table>
  <tr>
    <td colspan="2"><b>Peeps</b></td>
  </tr>
  <tr>
    <td>id(pk)</td>
    <td>date</td>
    <td>content</td>
    <td>user_id(fk)</td>
  </tr>
  <tr>
    <td><i>1</i></td>
    <td><i>2016-06-18</i></td>
    <td><i>Just doing the chitter challenge</i></td>
    <td><i>1</i></td>
  </tr>
</table>

#### Relations

User ---> _has many_ ---> Peeps
Peep ---> _has one_  ---> User
