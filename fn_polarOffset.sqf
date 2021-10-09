/*
	takes in a polar coordinate in arma-degrees and returns a 2d vector offset
	it's like getRelPos except not based on current direction
*/
params [
	"_bearing",
	"_magnitude"
];
private _mathBflipped = (_bearing + 90) % 360; // rotate 90º counterclockwise
[sin _mathBflipped, -1 * cos _mathBflipped] vectorMultiply _magnitude; // reflect over y-axis then vector multiply