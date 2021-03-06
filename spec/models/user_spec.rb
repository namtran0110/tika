require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "User.name" do
    it "returns 1 event when there is 1 event" do
      a = User.new name: "Nam"
      a.save(validate: false)
      expect(a.name).to eq "Nam"
    end
  end
  describe "User.email" do
    it "returns new user's email when created" do
      a = User.new name: "Nam", password: "asd", email: "abc@gmail.com"
      expect(a.email).to eq "abc@gmail.com"
    end
  end
end