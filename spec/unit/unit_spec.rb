# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter','02/22/2022', 'J.K. Rowling',13.49)
  end/

  it '/is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without values' do
    subject.title = nil
    subject.date = nil
    subject.author = nil
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid with bad values' do
    subject.title = 13.49
    subject.date = 'harry potter'
    subject.author = '2/22/2022'
    subject.price = 'J.K. Rowling'
    expect(subject).not_to be_valid
  end
end

