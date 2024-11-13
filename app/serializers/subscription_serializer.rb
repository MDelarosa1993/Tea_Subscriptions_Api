class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :status, :frequency, :customer_id

  attribute :customers do |subscription|
    customer = subscription.customer
    {
      id: customer.id,
      first_name: customer.first_name,
      last_name: customer.last_name,
      email: customer.email,
      address: customer.address
    }
  end

  attribute :teas do |object|
    object.teas.map do |tea|
      {
        id: tea.id,
        title: tea.title,
        description: tea.description,
        temperature: tea.temperature,
        brew_time: tea.brew_time
      }
    end
  end 
end
