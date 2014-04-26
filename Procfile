worker: bundle exec sidekiq
redis: redis-server redis://redistogo:80223efbe464766ad82688f139d80437@barreleye.redistogo.com:11424/
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
