[
	[
		{
			[
				[5,0],
				5,
				[
					[0,5],
					[0,-5]
				]
			] call DNV_fnc_distanceToPoint
		},
		[0,0],
		'Single intercept'
	],
	[
		{
			[
				[5,0],
				5,
				[
					[5,10],
					[5,-10]
				]
			] call DNV_fnc_distanceToPoint
		},
		[5,5],
		'Double intercept, returns first'
	]
] call DNV_fnc_testFunc;