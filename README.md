## Pet ID - an app that helps owners to recover their lost pets

Pet ID helps pet owners find their lost pets. How does it work? A Pet owner simply creates a account and registers their pets. Note that any personal information won't be shared. After siging in and adding a pet, the owner can add a photo and a full description of their pet. Later they can easily update their pets description, and report their pets as lost if needed. After the pet is reported lost, the pet appears within to the lost pet listing. The lost pet listing can be seen by anyone, meaning that a login is not required. The lost pet listing includes lost pet photos as well as the pet's names and the locations where they were lost. Once the pet is identified, email can sent to the owner. The sender's contact information is included within the email sent. The pet owner can then contact the sender and reunite with their pet and update the pet as found. Awesome, Fluffy is heading back home!

The objective of this project is to:

* Build a great app.
* Get experience collaborating and working in a development team.
* Showcase your abilities to potential employers, friends, family, and community members.


by *[Charlie Chrisman](https://github.com/cachrisman), [Andreas Blomquist](https://github.com/andreasbloomquist), and [David Deuber](https://github.com/deuber)*


## PLANNING

* **Scope.** The scope of project was identified very early on in the development phase. Our MVP was completed witin the first day of coding. We heavily leveraged [Trello](https://trello.com) to clearly communicate goals for each day of the project. 
* **User stories.** We used trello to create a clearly defined user story [Trello](https://trello.com).
* **Wireframes.** Wireframes we created before we starte the project and available at: ?
* **Object Models:**
![](/erd-small.png)
* **Milestones.** Day one: Basic Crud and Oauth. Day Two: Ajax, Photo capture API and search feature added. Day Three: Looking good with Bootstrap, Email feature added. Day Four: Signficant Color scheme and look of site improvements. Rspec for all models added. 


## CORE FEATURES

* **Models.** Pet ID app has 3 models, pets, report and user with appropriate associations and validations.
* **Views.** Pet ID uses **partials**  and loads data via Ajax when user updates their profile page.
* **RSPEC** Basic testing was created for all Models 
* **Postgres.** Pet ID uses [Postgres](http://postgresapp.com) for its database.
* **Handles invalid data.** Forms within the application, both client-side and with JavaScript and on the back-end with Rails, validate data and handle incorrect inputs. 
* **JavaScript & jQuery.** Event driven front-end is included the app, examples of this would be the search feature, add pets, date picker.
* **AJAX.** AJAX is used on the user's profile page to communicate with the server without reloading the page. This was used to add a pet. 
* **External APIs.** Facebook Oauth is used for login, Mandril for email, and Amazon for photo storing.
* **User Login.** Devise and Oauth are used to allow the owner to signup with secure server or with Facebook
* **Home and About pages** - A link within the header can take the user the Pet ID about page. 
* **Heroku.** PetId was deployed to Heroku from day one of production and automatically updated whenever we updated the git development branch.
* **User Experience** To enhance styling, CSS Bootstrap framework was used to allow for a pleasing and logical user experience
* **Responsive Design** Pet ID was built with create mobile-first, responsive, adaptive experience. 
* **File upload** For pet photos [Amazon S3](http://aws.amazon.com/s3/) was used for file hosting.
* **Job Scheduling** If we have time, we might impliment this for our emails
* **Email** Leveraged [Mandril](http://mandrill.com/) with [simple-captcha2](https://github.com/pludoni/simple-captcha) (authorization, are you human?) was used to allow for email notifications.


####Links:

* Link to Heroku hosted project

  [http://petid.herokuapp.com/](http://petid.herokuapp.com/)

* Link to source code on GitHub

  [https://github.com/petid/petid_app](https://github.com/petid/petid_app)
 

## TIMELINE, COMPLETED IN FOUR DAYS!

* June 22 -  Monday - Project work officially begins
* June 26 - Friday - Completed project deliverables due at 10am

