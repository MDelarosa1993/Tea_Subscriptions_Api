10.times do |i|
  Customer.create(
    first_name: ["John", "Jane", "Alice", "Bob", "Charlie", "David", "Eva", "Grace", "Hannah", "Ivy"].sample,
    last_name: ["Doe", "Smith", "Johnson", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson"].sample,
    email: "user#{i+1}@example.com", 
    address: "#{rand(1..9999)} #{['Elm', 'Oak', 'Pine', 'Maple', 'Birch'].sample} Street, Springfield, IL"
  )
end

teas = [
  { title: 'Green Tea', description: 'A refreshing green tea.', temperature: 80, brew_time: 3 },
  { title: 'Black Tea', description: 'A strong black tea.', temperature: 90, brew_time: 5 },
  { title: 'Herbal Tea', description: 'A calming herbal tea.', temperature: 85, brew_time: 4 },
  { title: 'Chamomile Tea', description: 'A soothing chamomile tea, perfect for relaxing.', temperature: 70, brew_time: 5 },
  { title: 'Oolong Tea', description: 'A unique oolong tea with a floral aroma.', temperature: 85, brew_time: 4 },
  { title: 'White Tea', description: 'A delicate white tea with a mild flavor.', temperature: 75, brew_time: 3 }
]

teas.each do |tea|
  Tea.create(tea)
end

10.times do |i|
  customer = Customer.order('RANDOM()').first # Randomly select a customer
  Subscription.create(
    title: "#{['Monthly', 'Weekly', 'Yearly'].sample} #{['Earthy', 'Yuck!', 'Herbal', 'Sleepy', 'IDK', 'Tea'].sample} Tea Subscription",
    price: rand(9.99..25.99).round(2),
    status: ['active', 'cancelled'].sample,
    frequency: ['monthly', 'weekly', 'yearly'].sample,
    customer: customer
  )
end

Subscription.all.each do |subscription|
  random_teas = Tea.order('RANDOM()').limit(rand(2..4)) # Randomly select 2 to 4 teas
  random_teas.each do |tea|
    SubscriptionTea.create(
      subscription: subscription,
      tea: tea
    )
  end
end

