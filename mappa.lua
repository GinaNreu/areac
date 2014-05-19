local storyboard = require ('storyboard')
local scene = storyboard.newScene()
local widget = require('widget')
local myApp = require('myapp')

widget.setTheme(myApp.theme)


-- funzioni
local views = {}
local goBack = {}
local accediProfilo = {}


-- variabili
local accedi
local titleBar
local titleText
local locationtxt

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

    titleText = display.newText( 'Mappa', 0, 0, myApp.fontBold, 20 )
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

    -- if ( system.getInfo( "environment" ) == "simulator" ) then
    --     local simulatorMessage = "Maps not supported in Corona Simulator.\nYou must build for iOS or Android to test native.newMapView() support."
    --     local allertMap = display.newText( simulatorMessage, _W*0.1, _H*0.40, _W*0.85, _H*0.4, native.systemFont, 16 )
    --     allertMap:setFillColor( 1, 0, 0 )
    --     allertMap.anchorX = 0
    --     allertMap.anchorY = 0
    -- end
    -- group:insert(allertMap)



    -- local statusBarBackground = display.newImageRect(myApp.topBarBg, display.contentWidth, display.topStatusBarContentHeight)
    -- statusBarBackground.x = display.contentCenterX
    -- statusBarBackground.y = display.topStatusBarContentHeight * 0.5
    -- group:insert(statusBarBackground)






    -- local contornoMappa = display.newRect( display.contentCenterX, display.contentCenterY+8, _W, _H*0.7 )
    local contornoMappa = display.newRect( 0, 70, _W, _H-119 )
    contornoMappa.anchorX, contornoMappa.anchorY = 0,0
    group:insert(contornoMappa)
    local myText = display.newText( 'Mappa', _W*0.5, _H*0.5, myApp.font, 20 )
    myText:setFillColor(0) 
    group:insert(myText)







    myMap = native.newMapView( display.contentCenterX, display.contentCenterY, _W, _H*0.7 )
    --myMap.x = display.contentCenterX
    --myMap.y = display.contentCenterY
    --myMap.mapType = "standard"
    --lat, long = myMap:getAddressLocation('Duomo di Milano')
    myMap:setCenter( 45.464224, 9.190321 )
    
    myMap:addMarker( 45.461462, 9.188465,
        { title = 'Varco Via Giuseppe Mazzini', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })
    myMap:addMarker( 45.477366, 9.180947,
        { title = 'Varco Via Legnano', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })
    myMap:addMarker( 45.477631, 9.181296,
        { title = 'Varco Via di Porta Tenaglia', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })
    myMap:addMarker( 45.478300, 9.181657,
        { title = 'Varco Via Moscova', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })
    myMap:addMarker( 45.480798, 9.182773,
        { title = 'Varco Via Volta', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })
    myMap:addMarker( 45.480328, 9.186689,
        { title = 'Varco Corso Garibaldi', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })
    myMap:addMarker( 45.480110, 9.187966,
        { title = 'Varco Via Milazzo', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })
    myMap:addMarker( 45.479637, 9.191952,
        { title = 'Varco Via Castelfidardo', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })  
    myMap:addMarker( 45.479637, 9.191952,
        { title = 'Varco Via Turati', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })
    myMap:addMarker( 45.474100, 9.204687,
        { title = 'Varco Corso Venezia', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })
    myMap:addMarker( 45.471534, 9.205188,
        { title = 'Varco Via Baretti', subtitle = 'Aperto dalle 7:00 alle 18:00' , imageFile = 'greenPin.png' })

    myMap.isLocationVisible = true
    myMap.isZoomEnabled = true
    group:insert(myMap)
end











function AccediProfilo()
    storyboard.removeAll()
    storyboard.gotoScene("accedi")
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
    myApp.targaVerifica = nil
    myMap:removeSelf()
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
