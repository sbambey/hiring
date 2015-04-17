toggle_checked = (element) ->
	if element.find('span').length
		element.find('span').remove()
		element.html($.trim(element.html()))
	else
		element.prepend('<span class="glyphicon glyphicon-check" aria-hidden="true"></span> ')

toggle_hidden = (element) ->
	if element.hasClass('hidden')
		element.removeClass('hidden')
		return true
	else
		element.addClass('hidden')
		return false

toggle_bool = (element) ->
	if element.val() == 'true'
		element.val('false')
	else
		element.val('true')

$(document).on 'click', '.btn-builder', (event) ->
	preview_field = $('.preview').find('#' + $(this).val()).closest('.field')

	# Toggles button checked
	toggle_checked($(this))

	# Toggles preview input field and its row
	is_visible = toggle_hidden(preview_field)
	if is_visible
		preview_field.closest('.row').removeClass('hidden')
	else
		if !preview_field.closest('.row').find('.field:not(.hidden)').length
			preview_field.closest('.row').addClass('hidden')

	# Toggles category section
	unhidden_fields_length = preview_field.closest('section').find('.field:not(.hidden)').length
	section = preview_field.closest('section')
	if unhidden_fields_length
		section.removeClass('hidden')
	else
		section.addClass('hidden')

	# Toggle hidden field bool for server side compliance
	toggle_bool($(this).prev('input[type=hidden]'))

	# Deselect button
	$(this).blur()
	
	event.preventDefault()