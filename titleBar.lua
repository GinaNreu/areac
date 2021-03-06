local storyboard = require ( "storyboard" )
local widget = require( "widget" )
local myApp = require( "myapp" ) 


	titleBar = {}

	function titleBar.new()

		print ("NEW TITLEBAR")
		local bgTitle = display.newImageRect(myApp.topBarBg, display.contentWidth, 50)
		bgTitle.x = display.contentCenterX
		bgTitle.y = 25 + display.topStatusBarContentHeight

		titleBar.titleText = display.newText( '', 0, 0, myApp.fontBold, 20 )
		titleBar.titleText:setFillColor(0,0,0)
		titleBar.titleText.x = display.contentCenterX
		titleBar.titleText.y = bgTitle.height * 0.5 + display.topStatusBarContentHeight

		titleBar.accedi = widget.newButton({
		    id  = 'BtAccedi',
		    label = 'Accedi',
		    x = display.contentCenterX*1.75,
		    y = bgTitle.height * 0.5 + display.topStatusBarContentHeight,
		    color = { 0.062745,0.50980,0.99607 },
		    fontSize = 18,
		    onRelease = titleBar.accedi
		})


		titleBar.profilo = widget.newButton({
		    id  = 'BtProfilo',
		    label = 'Profilo',
		    x = display.contentCenterX*1.75,
		    y = bgTitle.height * 0.5 + display.topStatusBarContentHeight,
		    color = { 0.062745,0.50980,0.99607 },
		    fontSize = 18
		})

		titleBar.indietro = widget.newButton({
		    id  = 'BtIndietro',
		    label = 'Indietro',
		    x = display.contentCenterX*0.3,
		    y = bgTitle.height * 0.5 + display.topStatusBarContentHeight,
		    color = { 0.062745,0.50980,0.99607 },
		    fontSize = 18,
		    scene = '', -- Scena in cui andare
		    optionsBack ={}, -- Parametri aggiuntivi da passare alla scena
		   	onRelease = titleBar.goBack
		})

		titleBar.accedi.isVisible = true
		titleBar.profilo.isVisible = false
		titleBar.indietro.isVisible = false


		return titleBar

	end

	function titleBar.goBack()
		print("GOBACK "..titleBar.indietro.scene)
	    storyboard.gotoScene(titleBar.indietro.scene, titleBar.indietro.optionsBack)
	end

	function titleBar.profilo()
	    storyboard.gotoScene("profilo")
	end

	function titleBar.accedi()
	    storyboard.gotoScene("accedi")
	end


	return titleBar

