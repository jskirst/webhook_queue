# Webhook Queue

Webhook Queue is simple Rails 5 application that listens for valid JSON POST requests made to the `/messages` endpoint and queues them for FIFO delivery with a Sidekiq job queue. It light weight and intended to be a highly resilient message queue system that can sit in front of a less reliable messaging consuming system that requires FIFO message delivery.

# Requirements

Webhook Queue requires Rails 5, a Redis client, Sidekiq and a Postgres database, which can be easily created as a Heroku app.

# Getting Started

First clone (or fork then clone) the app to a local repository and run bundle install.

```
> git clone git@github.com:jskirst/webhook_queue.git
> cd webhook_queue
> bundle install
```

You can then setup your database by setting the database related environment variables specified in `config/database.yml`.

```
> rake db:create
> rake db:migrate
```

Then set the two required environment variables, `ACCESS_TOKEN` and `RECEIVER_URL`. You can generate the `ACCESS_TOKEN` value by using `rake secret`, or any suitably random string generator. Keep this - you will need it to send messages to Webhook Queue. `RECEIVER_URL` should be set to the URL that Webhook Queue should forward its messages to.

Once that's complete you're ready to the puma server and start your Sidekiq worker. Note: in order to ensure FIFO delivery, you should not expand beyond a single Sidekiq worker process. You can horizontally scale the Puma web workers as high as needed.

# Using the Application

Setup any webhooks you would like to queue with Webhook Queue to point to the `/messages` endpoint of your new server - you only need to add, as a url parameter, your access token to authenticate your webhook publisher with your Queue (e.g. `http://myqueue.com/messages?access_token=xyz`). Now your ready to queue!

# How to contribute

This is a loosely maintained open source project. Please feel free to contribute by forking the application and sending overa pull request. You can execute the existing tests by running:

```
bundle exec cucumber
```

Cheers, and happy queueing!
