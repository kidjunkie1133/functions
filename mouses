local _mousestate = {
	_button1 = false,
	_button2 = false,
	_position = {x = 0, y = 0},
	_scroll = 0
}

function _G.mouse1click()
	_mousestate._button1 = true
	_mousestate._button1 = false
	return true
end

function _G.mouse1press()
	_mousestate._button1 = true
	return true
end

function _G.mouse1release()
	_mousestate._button1 = false
	return true
end

function _G.mouse2click()
	_mousestate._button2 = true
	_mousestate._button2 = false
	return true
end

function _G.mouse2press()
	_mousestate._button2 = true
	return true
end

function _G.mouse2release()
	_mousestate._button2 = false
	return true
end

function _G.mousemoveabs(x, y)
	_mousestate._position.x = x
	_mousestate._position.y = y
	return true
end

function _G.mousemoverel(x, y)
	_mousestate._position.x += x
	_mousestate._position.y += y
end

function _G.mousescroll(amount)
	_mousestate._scroll += amount
	return true
end

function _G.getmousepos()
	return _mousestate._position.x, _mousestate._position.y
end
