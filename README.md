# apollo
apollo is the worker app for the [artemis](https://github.com/patrickshobe/artemis) distributed video encoding solution. Apollo works by listening for encode jobs to sent to it from artemis, encoding the media from the network attached storage and then letting artemis know it is complete. 


## To Install
You will need to open a port on the computer that you run this on, look that up for your OS.
You will need to add the network attached storage, look that up for your OS. 

External dependencies: (These can all be installed via brew)
* FFMPEG
* Postgresql
* redis

1. Clone the repo
2. Bundle  & Update
` bundle && bundle update`
3. Create the DB
`rake db:{create,migrate}`
4. Set up Figaro
`bundle exec install figaro`
5. Edit your application.yml to resemble this ( with your own details )
```
development:
	LOCAL_PATH: /Volumes/ # Path to where your media is located.
	ARTEMIS_PATH: 'http://192.168.0.38:3200' # Where does artemis live?
	IDENTITY: "d5HYJMvYKS0_5Q # What is this workers artemis access_token?
```
6. Start Redis
` redis-server `
7. Start Sidekiq
` bundle exec sidekiq `
8. Start Rails on port 3100, set to listen for everything not just localhost
` rails s -b 0.0.0.0 -p 3100 `
