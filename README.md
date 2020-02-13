# Jungle

A mini e-commerce application built with Rails 4.2. I inherited a fully functioning app and added the following features & bug fixes.

### Features

- Sold out badge - when a product has 0 quantity, the sold out badge is displayed. This is implemented as a boolean method in the Product model
- Admin Categories - added the admin/categories routes, views & controller to allow admins to view and add categories.
- User authentication - added register/login/logout functionality utilizing 'has_secure_password' in the User model.
- Order details page enhancement - added table to show each line-item in the order (image, name, description, quantity, price), the total cost, and the email used to make the order.
- Email receipt - uses a mailer to send an order confirmation email

### Bug fixes

- Admin authorization - used basic http authentication to protect all admin routes
- Checking out with empty cart - if the user goes to the carts#show page, instead of displaying the contents and checkout button, they now see a message telling them their cart is empty.

### Tests

- Rspec - used Rspec to implement model tests on Users and Products
- Capybara - added a number of feature tests using capybara to simulate a user performing actions.

Screenshot of the page on load
![Screenshot of the page on load](https://github.com/AliceMathews/jungle/blob/master/docs/products_page.png)

Screenshot of the order confirmation page
![Screenshot of the order confirmation page](https://github.com/AliceMathews/jungle/blob/master/docs/order-page.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
