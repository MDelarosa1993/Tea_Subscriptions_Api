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

customer3 = Customer.create(
  first_name: 'Alice',
  last_name: 'Johnson',
  email: 'alice.johnson@example.com',
  address: '789 Maple Road, Springfield, IL'
)

customer4 = Customer.create(
  first_name: 'Bob',
  last_name: 'Brown',
  email: 'bob.brown@example.com',
  address: '1010 Pine Street, Springfield, IL'
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

tea4 = Tea.create(
  title: 'Chamomile Tea',
  description: 'A soothing chamomile tea, perfect for relaxing.',
  temperature: 70,
  brew_time: 5
)

tea5 = Tea.create(
  title: 'Oolong Tea',
  description: 'A unique oolong tea with a floral aroma.',
  temperature: 85,
  brew_time: 4
)

tea6 = Tea.create(
  title: 'White Tea',
  description: 'A delicate white tea with a mild flavor.',
  temperature: 75,
  brew_time: 3
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

subscription4 = Subscription.create(
  title: 'Bi-weekly Chamomile Tea Subscription',
  price: 12.99,
  status: 'active',
  frequency: 'bi-weekly',
  customer: customer3
)

subscription5 = Subscription.create(
  title: 'Monthly Oolong Tea Subscription',
  price: 20.99,
  status: 'active',
  frequency: 'monthly',
  customer: customer4
)

subscription6 = Subscription.create(
  title: 'Weekly White Tea Subscription',
  price: 14.99,
  status: 'canceled',
  frequency: 'weekly',
  customer: customer4
)

SubscriptionTea.create(subscription: subscription1, tea: tea1)
SubscriptionTea.create(subscription: subscription2, tea: tea2)
SubscriptionTea.create(subscription: subscription3, tea: tea3)
SubscriptionTea.create(subscription: subscription4, tea: tea4)
SubscriptionTea.create(subscription: subscription5, tea: tea5)
SubscriptionTea.create(subscription: subscription6, tea: tea6)

SubscriptionTea.create(subscription: subscription1, tea: tea2)
SubscriptionTea.create(subscription: subscription3, tea: tea1)
SubscriptionTea.create(subscription: subscription4, tea: tea3)
SubscriptionTea.create(subscription: subscription5, tea: tea4)
SubscriptionTea.create(subscription: subscription6, tea: tea5)
