# Urban Legend API

A RESTful API to supply OOP relationship for the client
Frontend repo: [LINK](https://github.com/oopanpan/urban_legend_fronend)

## Environment and dependency

ruby '2.7.1'
rails '~> 6.1.3'
bcrypt '~> 3.1.7'
rack-cors
jwt '~> 2.2'

## Database

postgreSQL
to install and set up postgreSQL on local machine, please refer [HERE](https://www.postgresql.org/download/)

## Setup

after successfully forking this repo, run the follow codes in local terminal

to resolve dependencies:

```bash
bundler install
```

to setup database:

```bash
rails db:create
rails db:migrate
```

default domain and port will be 127.0.0.1:3000

## License

[MIT](https://choosealicense.com/licenses/mit/)
