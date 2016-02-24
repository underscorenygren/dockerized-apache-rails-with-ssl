####Docker + Apache + Ruby1.9 + SSL + Rails + Passenger

A started project to get rails running in a container with SSL using apache and passenger. 

####Motivation

I wanted to quickly get up and running with a dockerized, SSL enabled apache and rails distribution

I was surprised I didn't come across this in my searching, so I decided to build it myself. 

####Installation

I've got most of my info from here: http://blog.miloot.com/blog/2013/10/25/how-to-setup-apache-with-passanger-plus-https-and-rails/

Generate your SSH key using `sudo sh ./gen_cert.sh` and follow the instructions.

You'll need to build a Debian Wheezy dist of the dockerized http and call it 'httpd-wheezy', 
I haven't added it to the Docker hub. You can get it from [git@github.com:underscorenygren/httpd.git]

(inside of the cloned httpd distribution):
`docker build -t httpd-wheezy .`

(Inside this directory once again)

Run the container using `docker-compose up -d`

The included rails files are a rails started project (`rails new ...`) with `passenger` 
and `therubyracer` installed (the latter to make V8 and rails-coffee work correctly - 
why it doesn't work out of the box is beyond me). 

####Some Whys

- Why __Debian Wheezy__? 
  Because __Jessie__ has dropped support for ruby 1.9. 

- Why Ruby 1.9?
  - Because I needed it.

- Why Passenger?
  - Because, once again, I needed it. 

- Wouldn't this be better with X?
  - Sure, feel free to submit a PR. 
