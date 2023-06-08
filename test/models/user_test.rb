require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user should not be saved without valid attributes" do
    p = User.new
    assert_not p.save, 'user instance is saving with empty attributes.'
  end

  test "user email should be valid" do
    u = users(:one)
    assert_not u.valid?, 'user instance is saving with invalid email.'
  end

end
