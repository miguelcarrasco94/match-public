require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user)
  end

  test 'no loged user can no visit activity index' do
    get activities_path
    assert_redirected_to new_user_session_path, 'Controller response unexpected'
  end

  test 'loged user can visit activity index' do
    sign_in @user
    get activities_path
    assert_response :success, 'Controller response unexpected'
  end

  test 'loged user can create an activity' do
    sign_in @user
    get new_activity_path, params: { activity: { name: 'Android Studio', location: 'UDC', type: 'Curso', locations: 'UDC', english: 0 } }
    assert_response :success, 'Controller response unexpected'
  end
end
