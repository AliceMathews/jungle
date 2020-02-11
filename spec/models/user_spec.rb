require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      @user = User.new(name: "alice", email: "1@gmail.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    it "is not valid when passwords do not match" do
      @user = User.new(name: "alice", email: "1@gmail.com", password: "password", password_confirmation: "passwd")
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "is not valid when password is not provided" do
      @user = User.new(name: "alice", email: "1@gmail.com", password_confirmation: "passwd")
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid when password is less than 5 characters" do
      @user = User.new(name: "alice", email: "1@gmail.com", password: "lih", password_confirmation: "lih")
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

    it "is not valid when email is not unique" do
      @user1 = User.create(name: "alice", email: "test@test.com", password: "password", password_confirmation: "password")
      @user2 = User.new(name: "stu", email: "test@test.com", password: "password", password_confirmation: "password")
      @user2.valid?
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "is not valid when email is not provided" do
      @user = User.new(name: "alice", password: "password", password_confirmation: "password")
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "is not valid when name is not provided" do
      @user = User.new(email: "alice@mail", password: "password", password_confirmation: "password")
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
  end
end
