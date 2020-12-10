class SesionesController < ApplicationController
	layout 'application_login'

  skip_before_action :login?,only: [:login, :validar_usuario]

  def login
    session[:usuario_id] = nil
  end

  def validar_usuario
  	@usuario = Usuario.where('login = ? and password = ?',
  		params[:login], params[:password]).first

  	if @usuario.nil?
  		validar = false
  	else
  		validar = true
      session[:usuario_id] = @usuario.id
      session[:nombre] = @usuario.nombre+' '+@usuario.paterno+' '+@usuario.materno
  	end

  	respond_to do |format|
  		if validar
  			format.html{redirect_to usuarios_path, notice: 'Sesion iniciada correctamente' }
  		else
  			format.html{redirect_to login_path, alert: 'Usuario/Password no valido'}
  		end
  	end
  end

  def cerrar_sesion
    session[:usuario_id] = nil
    session[:nombre] = nil
    respond_to do |format|
      format.html{redirect_to login_path, alert: "Sesión finalizada."}
    end
  end
end
