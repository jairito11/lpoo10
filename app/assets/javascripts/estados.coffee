# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_estado').validate
		rules:
			'estado[nombre]':
				required: true
				minlength: 3
			'estado[descripcion]':
				required: true
				minlength: 2
			'estado[pais_id]':
				required: true
		messages:
			'estado[nombre]':
				required: 'Ingresa un nombre'
				minlength: 'Minimo 3 caracteres'
			'estado[descripcion]':
				required: 'Ingresa la descripción'
				minlength: 'Minimo 2 caracteres'
			'estado[pais_id]':
				required: 'Ingresa el id del pais'
$(document).ready(ready)
$(document).on('turbolinks:load', ready)
