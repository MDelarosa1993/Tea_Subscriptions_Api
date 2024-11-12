class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :status, :frequency

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
