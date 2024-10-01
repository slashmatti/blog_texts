# BlogTexts
app for users to create widgets to put on their websites, allowing visitors to send them SMS messages. developed at [24 Hour MVP](https://founderhacker.com/24-hour-mvp).

## Installation
1. clone the repo
2. `cd <project> && bundle`
3. `rails db:setup && rails db:migrate`
4. `bundle exec figaro install`
5. `cp config/application-sample.yml config/application.yml` 


## Development
```
bin/dev # uses foreman gem to boot server + frontend
```

## Deploying
install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) and run `heroku login`. if repo admin has shared access to the server:

```
heroku git:remote -a heroku_app_name_here # you only need to do this once
git push heroku master # deploys master branch
git push heroku some_branch_name:master # deploys non-master branch
```

## Production management
to access the Rails console on the production server:
```
heroku run rails console
```
to add or update environment variables from your local `config/application.yml` file:
```
figaro heroku:set -e production
```
you will need Stripe and Postmark accounts, and then put in your API credentials as environment variables. you will need to [deploy a Textbelt server](https://github.com/founderhacker/textbelt_deployable)
