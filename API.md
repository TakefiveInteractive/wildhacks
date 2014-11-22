Assuming at this stage the entire map is limited to a 1km x 1km rectangle, centered around Wildhacks auditorium.

#Update position
URL: `/update_location`

Client request
```
{
	username: “xxxx”,
	latitude: 0,
	longitude: 0,
	distance: 0,

	// time when client last fetched buildings data from server
	last_updated: 341294028		// epoch time in seconds
}
```

Server response
```
{
	success: true,
	buildings_removed: ["", ""],
	buildings_changed: {
	},
	buildings_added: {
		“yyyy-1”: {
			type: “base”,
			username: “yyyy”,
			hp: 100,
			latitude: 0,
			longitude: 0
		},
		“xxxx-1”: {
			type: “turret”,
			username: “xxxx”,
			hp: 1,
			latitude: 2,
			longitude: 3.14159
		}
	}
}
```

#Get 