# Deploy hubot to heroku

1. Clone this repo
2. Run these commands:
```bash
    heroku create
    rm -rf .git
    git init
    git add .
    git commit -m "Initial Import"
    git push heroku master
    heroku addons:add redistogo:nano
    heroku heroku ps:scale web=1
    heroku config:add HEROKU_URL="http://myappname.herokuapp.com/"
    heroku config:add HUBOT_CAMPFIRE_ACCOUNT="mycampfiresubdomain"
    heroku config:add HUBOT_CAMPFIRE_ROOMS="12,41,52"
    heroku config:add HUBOT_CAMPFIRE_TOKEN="myhubotusercampfiretoken"
    heroku restart
```
3. Easy as pie.

Check `heroku logs` if anything is going wrong.