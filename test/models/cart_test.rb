require "test_helper"

RSpec.describe Cart, type: :model do
  it 'creat User' do
    user = User.new(email: "testUser@example.com", password: "testUser")
    expect(user).to be_valid
  end
end
