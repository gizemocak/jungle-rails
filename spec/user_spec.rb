require 'rails_helper'
RSpec.describe User, type: :model do

  describe 'Validations' do

    it "is not valid without a password" do
      user = User.new(email: 'gizem_ocak@outlook.com', password: nil, password_confirmation: '12345', first_name:'Gizem', last_name:'Ocak')
      expect(user).to_not be_valid
    end

    it "is not valid without a password_confirmation" do
      user = User.new(email: 'gizem_ocak@outlook.com', password: '12345', password_confirmation:'123' , first_name:'Gizem', last_name:'Ocak')
      expect(user).to_not be_valid
    end

    it "password and password_confirmation should match" do
      user = User.new(email: 'gizem_ocak@outlook.com', password:'123456', password_confirmation:'12345', first_name:'Gizem', last_name:'Ocak')
      expect(user).to_not be_valid
    end

    it 'email must be unique' do
      user = User.new(email: 'gizem_ocak@outlook.com', password:'12345', password_confirmation: '12345', first_name:'Gizem', last_name:'Ocak')
      user.save
    
      u = User.new(email: 'gizem_ocak@outlook.com', password:'1234567', password_confirmation: '1234567', first_name:'Gizem', last_name:'Ocak')
      u.save
      expect(u).to_not be_valid
    end

    it "is not valid without an email" do
      user = User.new(email:nil, password:'1234567', password_confirmation: '1234567', first_name:'Gizem', last_name:'Ocak')
      expect(user).to_not be_valid
    end

    it "is not valid without a first_name" do
      user = User.new(email:'gizem_ocak@outlook.com', password:'1234567', password_confirmation: '1234567', first_name:nil, last_name:'Ocak')
      expect(user).to_not be_valid
    end

    it "is not valid without a last_name" do
      user = User.new(email:'gizem_ocak@outlook.com', password:'1234567', password_confirmation: '1234567', first_name:'Gizem', last_name:nil)
      expect(user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end