require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "#association" do
    it "should have belongs_to posts association" do
      t = Comment.reflect_on_association(:post)
      expect(t.macro).to eq(:belongs_to)
    end

    it "should have belongs_to user association" do
      t = Comment.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
