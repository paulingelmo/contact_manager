require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:phone_number) do
    PhoneNumber.new(number: "3057945233", person_id: 1)
  end
  it 'is valid' do
    expect(phone_number).to be_valid
  end
  it 'is invalid without a number' do
    phone_number.number = nil
    expect(phone_number).to_not be_valid
  end
  it 'must have a reference to a person' do
    phone_number.person_id = nil
    expect(phone_number).not_to be_valid
  end
  it 'is associated with a person' do
    expect(phone_number).to respond_to(:person)
  end
end
