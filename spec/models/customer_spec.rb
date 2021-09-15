require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many(:subscriptions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
  end
end


#   before :each do
#
#   end
#
#   describe 'class methods' do
#     describe '.' do
#     end
#   end
#
#   describe 'instance methods' do
#     describe '#' do
#     end
#   end
