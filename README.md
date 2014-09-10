##To-do: A to-do list application with automatic deletion of uncompleted tasks after 7 days.

To-do is a Ruby on Rails application. It helps keep users motivated to get things done by putting an expiration date on their tasks. It uses Devise for authentication. To-do is deployed to Heroku [Here](http://devtheory-todo.herokuapp.com)

Setup
--
c**config/application.yml needs to have the following ENV variables:**

DEVISE_SECRET_KEY: 'your devise secret key here'

SENDGRID_USERNAME: 'your sendgrid username here'

SENDGRID_PASSWORD: 'your sendgrid password here'