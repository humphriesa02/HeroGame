// Text box will start as a line in the center of the window
// then grow to the full size
x1 = RESOLUTION_W/2;
y1 = RESOLUTION_H-70;
x2 = RESOLUTION_W/2;
y2 = RESOLUTION_H;

// The location that the text box will stretch to
x1Target = 0;
x2Target = RESOLUTION_W;

// Progress of our text stretch animation
lerpProgress = 0;
// number of characters we're going to show in our message
textProgress = 0;

responses = ["Test response", "Test response two"];
responseSelected = 0;