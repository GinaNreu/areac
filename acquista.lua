local storyboard = require ('storyboard')
local scene = storyboard.newScene()
local widget = require('widget')
local myApp = require('myapp')

widget.setTheme(myApp.theme)


-- funzioni
local titleText
local locationtxt
local views = {}
local goBack = {}
local accediProfilo = {}


-- variabili
local accedi
local titleBar
local titleText


local function ignoreTouch( event )
	return true
end






function scene:createScene(event)
	local group = self.view

    local background = display.newRect(0,0,display.contentWidth, display.contentHeight)
    background:setFillColor(0.9, 0.9, 0.9)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    group:insert(background)

    ------ instanzio nav bar e bottoni
    titleBar = display.newImageRect(myApp.topBarBg, display.contentWidth, 50)
    titleBar.x = display.contentCenterX
    titleBar.y = 25 + display.topStatusBarContentHeight

    titleText = display.newText( 'Acquista', 0, 0, myApp.fontBold, 20 )
    titleText:setFillColor(0,0,0)
    titleText.x = display.contentCenterX
    titleText.y = titleBarHeight * 0.5 + display.topStatusBarContentHeight

	accedi = widget.newButton({
        id  = 'BtAccedi',
        label = 'Accedi',
        x = display.contentCenterX*1.75,
        y = titleBarHeight * 0.5 + display.topStatusBarContentHeight,
        color = { 0.062745,0.50980,0.99607 },
        fontSize = 18,
        onRelease = AccediProfilo
    })
    group:insert(titleBar)
    group:insert(titleText)
    group:insert(accedi)
    

    -- local statusBarBackground = display.newImageRect(myApp.topBarBg, display.contentWidth, display.topStatusBarContentHeight)
    -- statusBarBackground.x = display.contentCenterX
    -- statusBarBackground.y = display.topStatusBarContentHeight * 0.5
    -- group:insert(statusBarBackground)


    local myText = display.newText( 'Acquista', _W*0.5, _H*0.5, myApp.font, 20 )
    myText:setFillColor(0) 
    group:insert(myText)
end












function AccediProfilo()
    storyboard.removeAll()
    storyboard.gotoScene("accedi", { params = { var = 0 } })
end

function goBack()
    storyboard.removeAll()
    storyboard.gotoScene(storyboard.getPrevious())
end










function scene:enterScene( event )
	local group = self.view

end

function scene:exitScene( event )
	local group = self.view

	--
	-- Clean up native objects
	--

end

function scene:destroyScene( event )
	local group = self.view
end

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

return scene
