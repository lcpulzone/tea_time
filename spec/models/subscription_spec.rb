require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to(:tea) }
    it { should belong_to(:customer) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:frequency) }

    it { should define_enum_for(:status).with({active: 0, cancelled: 1}) }
  end
end

  # before :each do
  #
  # end
  #
  # describe 'class methods' do
  #   describe '.' do
  #   end
  # end
  #
  # describe 'instance methods' do
  #   describe '#' do
  #   end
