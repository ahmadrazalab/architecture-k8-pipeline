# 3 TIER APPLICATION -  
### HOME PAGE
### LOGIN PAGE
### TODO APP



# HOME PAGE 

# LOGIN PAGE

# LOGIN PAGE WITH DB
 
## dir info
- Here is basic user login page, which is authenticated by backend database (only users exist in db can login to that page)
- after successful login the page forward to any other url that is specified in the login.php file 
- here is db.sql file whehre is sql query is written to create new user in db table 

## FILES
db.sql = to create a user for the authetication of login page

login.php = 
        # up date the db creds for auth 
        $servername = "127.0.0.1";
        $username = "admin";
        $password = "password";
        $dbname = "login-page";

        # update the redirect url after login successfull
        header("Location: index.html");
        header("Location: http://localhost");

Index.html = index. file for front end 