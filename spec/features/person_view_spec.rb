require 'rails_helper'

describe 'the person view', type: :feature do
  let(:person) do
    Person.create(first_name: 'Joe', last_name: 'Doe')
  end
  before(:each) do
    person.phone_numbers.create(number: '305-790-7271')
    person.phone_numbers.create(number: '786-550-4578')
    visit person_path(person)
  end
  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end
  it 'has a link to add a new phone number' do
    expect(page).to have_link('Add phone number', href: new_phone_number_path(person_id: person.id))
  end
  it 'adds a new phone number' do
    page.click_link('Add phone number')
    page.fill_in('Number', with: '305-661-6474')
    page.click_button('Create Phone number')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('305-661-6474')
  end
end
