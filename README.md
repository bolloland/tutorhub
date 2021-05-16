# TUTORHUB

## INSTALL INSTRUCTIONS

Fork and Clone this repo
run *bundle install

Tutohub is meant to help students find a tutor, and let tutors schedule lessons with students. 
Future versions could have uses within a school, professional development within a company, a district's network, or a neighborhood.

Gem Install and Update

$ `bundle install`

Third Party Access

To access the app, you'll need third party access through Google. 
Follow these steps:

go to: [https://console.developers.google.com/apis]

- Left Side Menu : click `Credentials` >
- then at top/middle of the page, in blue, click on `+ Create Credentials` and choose option `OAuth Client ID` >
- APPLICATION TYPE*: Web Application, NAME* : < your name/username >
- (you can skip "Authorized JavaScript Origins" and "Authorized redirct URIs")
- and click on `CREATE`

"OAuth Client Created" pop-up should appear.
Leave this page open or copy the Client ID and Secret Key and paste them in a file to come back to.

Find a file named .blank_env in the top directory. 
Change the file name to ".env" (right click > Rename)

- open .env
- in .env, list the following:
```GOOGLE_CLIENT_ID = <paste Your Client ID here>
GOOGLE_SECRET_CLIENT = <paste Your Client Secret here>
```

open the ".gitignore" file, and type ".env" under the last line of that file

$ `rails s `
and use localhost:3000 on your browser to navigate the app

## Sample Demo Video:

A brief description of this program's capabilities can be found here: [Demo Video](https://www.loom.com/share/c7198f5330d14183beae992707a538ef?sharedAppSource=personal_library)

## Contributor Guide 

Bug reports and inquiries are welcome at: [https://github.com/bolloland/tutorhub]

## Code of Conduct

[Code of Conduct](https://github.com/bolloland/tutorhub/.code_of_conduct.md)

## License Information

[MIT License](https://github.com/bolloland/tutorhub/blob/master/LICENSE)

