# README
### MyStore APP
## Articles catalog powered by Ruby on Rails
# This app currently provides:
- Brands catalog
- Categories catalog
- Subcategories catalog. Each subcategory belongs to a category (one to many relationship)
- Articles catalog. Each article has the following relationships (one to many) with each of the previous catalogs.
- User authorization.
- User authentication.

* Ruby version
  -`3.1.1`

* Configuration to run the app locally (happy path)
  - `git clone https://github.com/angelprg/my-store.git`
  - `bundle install`
  - `rails db:migrate`
  - `rails s`
  - Open the app using the url: `http://localhost:3000/`
  - Create a new user using the option "Create account"
  - In another terminal, run `rails c`
  - From the ruby console, execute the following instructions:
    - `user = User.last`
    - `user.role = 'admin'`
    - `user.save`
  
  Now you should be able to access to the admin dashboard and start adding *brands* and *categories*, then *subcategories*, and finally *articles*.

* Services (job queues, cache servers, search engines, etc.)
  The app includes by default a mail notification each time a user adds or modifies an article.
  In order to enable it, you should add your mail provider configuration in the corresponding `config/environments/(environment).rb` file

* Deployment instructions
  By default the production environment uses `postgresql` as a database, and `amazon s3` as a storage service. You should modify your `database.yml` and `storage.yml`files if needed, along to setup your environment variables.

* ...
