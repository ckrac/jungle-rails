
Jungle App Project
=====================

# Jungle

A mini e-commerce application built with Rails 4.2. Jungle will allow users to shop online and make online purchases via stripe. Users can create reviews by submitting a description and rating to specific products. They will also be able to delete their own reviews. An admin can create categories and new products for the app.

## Screenshots

!["Home page"]()
!["Product detail"]()
!["Cart"]()


## Getting Started

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe