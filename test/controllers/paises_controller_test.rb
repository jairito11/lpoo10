require 'test_helper'

class PaisesControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get paises_inicio_url
    assert_response :success
  end

end
