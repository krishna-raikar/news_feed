require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#association" do
    it "should have has_many posts association" do
      t = User.reflect_on_association(:posts)
      expect(t.macro).to eq(:has_many)
    end

    it "should have has_many comments association" do
      t = User.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end
  end
end
