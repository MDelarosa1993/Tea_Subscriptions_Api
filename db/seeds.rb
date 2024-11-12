customer1 = Customer.create(
  first_name: 'John',
  last_name: 'Doe',
  email: 'john.doe@example.com',
  address: '1234 Elm Street, Springfield, IL'
)

customer2 = Customer.create(
  first_name: 'Jane',
  last_name: 'Smith',
  email: 'jane.smith@example.com',
  address: '5678 Oak Avenue, Springfield, IL'
)

tea1 = Tea.create(
  title: 'Green Tea',
  description: 'A refreshing green tea.',
  temperature: 80,
  brew_time: 3
)

tea2 = Tea.create(
  title: 'Black Tea',
  description: 'A strong black tea.',
  temperature: 90,
  brew_time: 5
)

tea3 = Tea.create(
  title: 'Herbal Tea',
  description: 'A calming herbal tea.',
  temperature: 85,
  brew_time: 4
)

subscription1 = Subscription.create(
  title: 'Monthly Green Tea Subscription',
  price: 15.99,
  status: 'active',
  frequency: 'monthly',
  customer: customer1
)

subscription2 = Subscription.create(
  title: 'Weekly Black Tea Subscription',
  price: 9.99,
  status: 'canceled',
  frequency: 'weekly',
  customer: customer1
)

subscription3 = Subscription.create(
  title: 'Monthly Herbal Tea Subscription',
  price: 18.99,
  status: 'active',
  frequency: 'monthly',
  customer: customer2
)

SubscriptionTea.create(subscription: subscription1, tea: tea1)
SubscriptionTea.create(subscription: subscription2, tea: tea2)
SubscriptionTea.create(subscription: subscription3, tea: tea3)

