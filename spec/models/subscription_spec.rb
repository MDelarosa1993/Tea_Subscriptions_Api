require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it { should belong_to(:customer) }
  it { should have_many(:subscription_teas)}
  it { should have_many(:teas).through(:subscription_teas) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should validate_presence_of(:status) }
  it { should validate_inclusion_of(:status).in_array(%w[active cancelled]) }
  it { should validate_presence_of(:frequency) }
  it { should validate_inclusion_of(:frequency).in_array(%w[weekly monthly yearly]) }
end
