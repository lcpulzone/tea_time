require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to(:tea) }
    it { should belong_to(:customer) }
  end
end

  # describe 'validations' do
  #   it { should validate_presence_of(:) }
  # end
  #
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
