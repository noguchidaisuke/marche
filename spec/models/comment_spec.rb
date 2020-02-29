require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is invalid without rating" do
    comment = Comment.new(comment: "例文")
    expect(comment).not_to be_valid
  end
end
