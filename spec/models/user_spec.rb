require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  
  before :each do
    @test_user = User.create(name: 'Bob', email: 'Bob@test.com', password: 'bob12345', password_confirmation: 'bob12345')
  end 


  it "saves a user succesfully with the required fields" do 
    expect(@test_user).to be_valid
  end

  it "should only accept unique emails, even case sensitive" do
    @redundant_user = User.create(name: 'Alice', email: 'Bob@test.com', password: 'bob1234', password_confirmation: 'bob1234')
    @case_sensitive = User.create(name: 'Alice', email: 'BOb@tEst.cOm', password: 'password1', password_confirmation: 'password1')
    expect(@redundant_user).to_not be_valid
    expect(@case_sensitive).to_not be_valid
    
  end

  it "should not save when the password and password confirmation are different" do
    @bad_password = User.create(name: 'Bob', email: 'Bob@test.com', password: 'bob123', password_confirmation: 'bob1234')
    expect(@bad_password).to_not be_valid
  end

  it "passwords should have a minimum length" do
    @little_password = User.create(name: 'Bob', email: 'Bob@test.com', password: '1', password_confirmation: '1')
    expect(@little_password).to_not be_valid
  end

  describe '.authenticate_with_credentials' do 
    it "should authenticate even with white space around email"
    it "should accept when a user types in the wrong case"
  end


  end
end


