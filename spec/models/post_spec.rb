require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#association" do
    it "should have has_many comments association" do
      t = Post.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end

    it "should have belongs_to user association" do
      t = Post.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
