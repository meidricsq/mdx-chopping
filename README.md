# MDX-CHOPPING

Chopping cars for car parts which can be converted into materials ( WIP )

[Preview](https://www.youtube.com/watch?v=26pRXRSw1BM)

# Install

Add these 4 items into your qb-core/shared/items.lua along with the photos
```
        ['door'] 						 = {['name'] = 'door', 							['label'] = 'Door', 					['weight'] = 0, 		['type'] = 'item', 		['image'] = 'door.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['hood'] 						 = {['name'] = 'hood', 							['label'] = 'Hood', 					['weight'] = 0, 		['type'] = 'item', 		['image'] = 'hood.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['trunk'] 						 = {['name'] = 'trunk', 						['label'] = 'Trunk', 					['weight'] = 0, 		['type'] = 'item', 		['image'] = 'trunk.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['wheels'] 						 = {['name'] = 'wheels', 						['label'] = 'Wheels', 					['weight'] = 0, 		['type'] = 'item', 		['image'] = 'wheels.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
```
Add this to your qb-target/init.lua in Config.Peds

```
[1] = { 
		model = 's_m_y_armymech_01', 
		coords = vector4(2403.52, 3127.87, 48.15, 245.59),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  useModel = false, 
		  options = { 
			{ 
			  type = "client", 
			  event = "mdx-chopshop:client:getList", 
			  icon = 'fas fa-bars', 
			  label = 'Get List', 
			}
		  },
		  distance = 2.5, 
		},
	  },
```

Then set up your location in config and you are good to go!


