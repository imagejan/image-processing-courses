#@ File input
#@output title
#@output length
open(input)
title = getTitle();
run("Split Channels");
selectWindow(title + " (blue)");
run("Gaussian Blur...", "sigma=1");
setAutoThreshold("Otsu");
setOption("BlackBackground", true);
run("Convert to Mask");
run("Skeletonize (2D/3D)");
run("Analyze Skeleton (2D/3D)", "prune=none calculate");
close();
close();
close();
close();
close();
length = getResult("Longest Shortest Path", 0);
