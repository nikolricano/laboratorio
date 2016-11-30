require 'test_helper'

class LaboratorioControllerTest < ActionController::TestCase
  test "should get page_1" do
    get :page_1
    assert_response :success
  end

  test "should get page_2" do
    get :page_2
    assert_response :success
  end

end
