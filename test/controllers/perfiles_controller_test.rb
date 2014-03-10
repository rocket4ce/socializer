require 'test_helper'

class PerfilesControllerTest < ActionController::TestCase
  setup do
    @perfil = perfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perfil" do
    assert_difference('Perfil.count') do
      post :create, perfil: { celular: @perfil.celular, ciudad: @perfil.ciudad, descripcion: @perfil.descripcion, face: @perfil.face, flr: @perfil.flr, g: @perfil.g, link: @perfil.link, pin: @perfil.pin, tabajo: @perfil.tabajo, telefono: @perfil.telefono, tw: @perfil.tw, user_id: @perfil.user_id, you: @perfil.you }
    end

    assert_redirected_to perfil_path(assigns(:perfil))
  end

  test "should show perfil" do
    get :show, id: @perfil
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @perfil
    assert_response :success
  end

  test "should update perfil" do
    patch :update, id: @perfil, perfil: { celular: @perfil.celular, ciudad: @perfil.ciudad, descripcion: @perfil.descripcion, face: @perfil.face, flr: @perfil.flr, g: @perfil.g, link: @perfil.link, pin: @perfil.pin, tabajo: @perfil.tabajo, telefono: @perfil.telefono, tw: @perfil.tw, user_id: @perfil.user_id, you: @perfil.you }
    assert_redirected_to perfil_path(assigns(:perfil))
  end

  test "should destroy perfil" do
    assert_difference('Perfil.count', -1) do
      delete :destroy, id: @perfil
    end

    assert_redirected_to perfiles_path
  end
end
