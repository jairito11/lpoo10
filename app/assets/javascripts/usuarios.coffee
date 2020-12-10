# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_usuarios').validate
		rules:
			'usuario[rfc]':
				required: true
				minlength: 13
				remote:
					url: '/validar_rfc'
					type: 'GET',
					data: 
						usuario_id: -> 
							return $('#usuario_id').val()	
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'usuario[curp]':
				required: true
				minlength: 18
			'usuario[nombre]':
				required: true
				minlength: 3
				maxlength: 50
			'usuario[paterno]':
				required: true
				minlength: 3
				maxlength: 50
			'usuario[materno]':
				required: true
				minlength: 3
				maxlength: 50
			'usuario[telefono]':
				required: true
				number: true
				minlength: 10
				maxlength: 10
			'usuario[correo]':
				required: true
				email: true
			'usuario[login]':
				required: true
				minlength: 6
				maxlength: 50
			'usuario[password]':
				required: true
				minlength: 6
				maxlength: 50
			'usuario[estado_id]':
				required: true
		messages:
			'usuario[rfc]':
				required: 'RFC Requerido'
				minlength: 'Minimo 13 Caracteres'
				remote: 'RFC no valido'
			'usuario[curp]':
				required: 'CURP Requerido'
				minlength: 'Minimo 18 Caracteres'
			'usuario[nombre]':
				required: 'Nombre requerido'
				minlength: 'Minimo 3 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'usuario[paterno]':
				required: 'Apellido paterno requerido'
				minlength: 'Minimo 3 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'usuario[materno]':
				required: 'Apellido materno requerido'
				minlength: 'Minimo 3 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'usuario[telefono]':
				required: 'Telefono requerido'
				number: 'Solo numeros'
				minlength: 'Minimo 10 números'
				maxlength: 'Maximo 10 números'
			'usuario[correo]':
				required: 'Correo requerido'
				email: 'Utiliza un formato valido de correo'
			'usuario[login]':
				required: 'Indicar un nombre de usuario'
				minlength: 'Minimo 6 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'usuario[password]':
				required: 'Indicar una contraseña'
				minlength: 'Minimo 6 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'usuario[estado_id]':
				required: 'Selecciona una opción'
$(document).ready(ready)
$(document).on('turbolinks:load', ready)