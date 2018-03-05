require 'rails_helper'

RSpec.describe User, type: :model do

  it "first_name should be nil and return an error" do
    @user = User.new(first_name: nil,
      last_name: 'Racadio',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password')

    expect(@user).to_not be_valid
    expect(@user.errors[:first_name].size).to eq(1)
  end

  it "last_name should be nil and return an error" do
    @user = User.new(first_name: 'Clark',
      last_name: nil,
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password')

    expect(@user).to_not be_valid
    expect(@user.errors[:last_name].size).to eq(1)
  end

  it "email should be nil and return an error" do
    @user = User.new(first_name: 'Clark',
      last_name: 'Racadio',
      email: nil,
      password: 'password',
      password_confirmation: 'password')

    expect(@user).to_not be_valid
    expect(@user.errors[:email].size).to eq(2)
  end

  describe "password validations" do
    it "should require a password" do
      @user = User.new(first_name: 'Clark',
        last_name: 'Racadio',
        email: 'test@test.com',
        password: nil,
        password_confirmation: nil)

      expect(@user).to_not be_valid
    end

    it "should require password and password_confirmation to be the same" do
      @user = User.new(first_name: 'Clark',
        last_name: 'Racadio',
        email: 'test@test.com',
        password: 'hellofriend',
        password_confirmation: 'password')

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages.size).to eq(3)
    end

    it 'should require a minimum length for the password' do
      @user = User.new(first_name: 'Clark',
        last_name: 'Racadio',
        email: 'test@test.com',
        password: 'pass',
        password_confirmation: 'pass')

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages.size).to eq(2)
    end
  end

  it "should reject email address if it's not unique(not case sensitive)" do
    @user1 = User.create!(first_name: 'Clark',
      last_name: 'Racadio',
      email: 'testm@test.com',
      password: 'password',
      password_confirmation: 'password')
    @user2 = User.new(first_name: 'Clark',
      last_name: 'Racadio',
      email: 'TESTM@TEST.com',
      password: 'password',
      password_confirmation: 'password')
    expect(@user2).to_not be_valid
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should return a valid user if email and password matches' do
      @user = User.create!(first_name: 'Clark',
        last_name: 'Racadio',
        email: 'test10@test10.com',
        password: 'password',
        password_confirmation: 'password')
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to be_valid
      expect(@user.authenticate_with_credentials(@user.email, 'passssword')).to eq(nil)
    end

    it 'should authenticate successfully if visitor types in spaces before and after their email address' do
      @user = User.create!(first_name: 'Clark',
        last_name: 'Racadio',
        email: 'test15@test15.com',
        password: 'password',
        password_confirmation: 'password')
      expect(@user.authenticate_with_credentials(' test15@test15.com ', @user.password)).to be_valid
    end

    it 'should authenticate successfully if a visitor types in the wrong case for their email' do
      @user = User.create!(first_name: 'Clark',
        last_name: 'Racadio',
        email: 'test16@test16.com',
        password: 'password',
        password_confirmation: 'password')
      expect(@user.authenticate_with_credentials('Test16@test16.coM', @user.password)).to be_valid
    end
  end
end




