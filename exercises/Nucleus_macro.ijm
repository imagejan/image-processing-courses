myCurrentTitle = getTitle();
selectWindow(myCurrentTitle);
run("Gaussian Blur...", "sigma=1");
setAutoThreshold("Default dark");
//run("Threshold...");
setOption("BlackBackground", true);
run("Convert to Mask");
run("Watershed");
run("Analyze Particles...", "size=0-Infinity show=Masks display summarize");
