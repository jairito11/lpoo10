# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_pais').validate
		rules:
			'pais[nombre]':
				required: true
				minlength: 3
			'pais[description]':
				required: true
				minlength: 2
		messages:
			'pais[nombre]':
				required: 'Ingresa un nombre'
				minlength: 'Minimo 3 caracteres'
			'pais[description]':
				required: 'Ingresa la descripción'
				minlength: 'Minimo 2 caracteres'
$(document).ready(ready)
$(document).on('turbolinks:load', ready)
