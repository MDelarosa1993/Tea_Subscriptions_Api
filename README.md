# README
ruby version 3.2.2
run bundle install
For database creation: rails db:{drop,create,migrate,seed}
For rspec test run: bundle exec rspec
[Table_Associations](image.png)

---

# Tea Subscription App

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Installation](#installation)
4. [Usage](#usage)
5. [API Endpoints](#api-endpoints)
6. [Technologies Used](#technologies-used)
7. [Contributing](#contributing)
8. [License](#license)

---

### Overview

**Tea Subscription App** is a Rails-based web application that allows Customers to subscribe to receive curated selections of teas on a weekly, monthty basis. The app offers different subscription plans.

---

### Features
{
    "data": [
        {
            "id": "9",
            "type": "subscription",
            "attributes": {
                "title": "Monthly Herbal Tea Subscription",
                "price": "21.12",
                "status": "active",
                "frequency": "weekly",
                "customer_id": 6,
                "customers": {
                    "id": 6,
                    "first_name": "Eva",
                    "last_name": "Wilson",
                    "email": "user6@example.com",
                    "address": "8357 Elm Street, Springfield, IL"
                },
                "teas": [
                    {
                        "id": 3,
                        "title": "Herbal Tea",
                        "description": "A calming herbal tea.",
                        "temperature": 85,
                        "brew_time": 4
                    },
                    {
                        "id": 1,
                        "title": "Green Tea",
                        "description": "A refreshing green tea.",
                        "temperature": 80,
                        "brew_time": 3
                    }
                ]
            }
        },
   ]
} 


---

### Installation

To set up and run this app locally, follow these steps:

1. Clone the repository:
   git clone https://github.com/MDelarosa1993/rails-api-starter-take-home.git

2. Navigate to the project directory:
   cd rails-api-starter-take-home

3. Install the required gems:
   bundle install

4. Set up the database:
   rails db:create
   rails db:migrate

5. Seed the database with some sample data (optional):
   rails db:seed

6. Start the Rails server:
   rails server

Your app will be running at `http://localhost:3000`.

---

### Usage


---

### API Endpoints

Here’s a list of available API endpoints:

- `GET http://localhost:3000/api/v1/subscriptions` - Get all subscription plans for a customer and teas.
- `PATCH http://localhost:3000/api/v1/subscriptions/:id` - Get one subscription with the customer associated with it and the teas the subscription has.
- `PATCH http://localhost:3000/api/v1/subscriptions/:id` - Cancel or activate a subscription plan.
- `GET http://localhost:3000/api/v1/teas` - View available teas.
- `GET http://localhost:3000/api/v1/customers` - View available customers.

---

### Technologies Used

- **Ruby on Rails**: Framework used for building the backend of the app.
- **PostgreSQL**: Database for storing user, subscription, and tea data.
- **ActiveRecord**: ORM used for interacting with the database.
- **RSpec**: Testing framework for unit and integration tests.

---

### Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a pull request.

---

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This version of the README is specific to your Tea Subscription App and focuses on user and admin functionality, subscriptions, and tea management, as well as offering API endpoints for backend operations. You can adjust the details depending on your app's specific features.