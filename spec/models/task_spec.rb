require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with a title" do
    task = Task.new(title: "Test task")
    expect(task).to be_valid
  end

  it "is invalid without a title" do
    task = Task.new(title: nil)
    expect(task).to_not be_valid
  end
end
