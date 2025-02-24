require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'devise modules' do
    it 'includes expected devise modules' do
      expect(User.devise_modules).to include(
        :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :validatable,
        :confirmable,
        :trackable,
        :omniauthable
      )
    end
  end

  describe 'validations' do
    let(:user) { build(:user) }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'requires an email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'requires a unique email' do
      create(:user, email: 'test@example.com')
      user.email = 'test@example.com'
      expect(user).not_to be_valid
    end

    it 'requires a password' do
      user.password = nil
      expect(user).not_to be_valid
    end
  end

  describe 'authentication' do
    let(:user) { create(:user) }

    it 'authenticates with correct password' do
      expect(user.valid_password?('correct_password')).to be_truthy
    end

    it 'does not authenticate with incorrect password' do
      expect(user.valid_password?('wrong_password')).to be_falsey
    end
  end

  describe 'confirmable' do
    let(:user) { create(:user) }

    it 'is not confirmed by default' do
      expect(user.confirmed?).to be_falsey
    end

    it 'can be confirmed' do
      user.confirm
      expect(user.confirmed?).to be_truthy
    end
  end
end