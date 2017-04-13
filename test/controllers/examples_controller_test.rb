require 'test_helper'

class ExamplesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get examples_new_url
    assert_response :success
  end

end
