/*
 * Macro template to process multiple images in a folder
 */

#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".tif") suffix

// See also Process_Folder.py for a version of this code
// in the Python scripting language.

processFolder(input);

// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
	list = getFileList(input);
	list = Array.sort(list);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
	// Do the processing here by adding your own code.
	// Leave the print statements until things work, then remove them.
	print("Processing: " + input + File.separator + file);
	otherFile = replace(file, "_w1", "_w5");
	print("Also processing: " + input + File.separator + otherFile);

	open(input + File.separator + file);
	// Here we process the _w1 files
	// Processing to get nucleus count (paste your macro here)

	// Rename "Summary" table to "Results"

	// Get the "Count" value from the Results table
	
	close();

	open(input + File.separator + otherFile);
	// Here we process the _w5 files
	// Processing to get the spot count

	// Get the "Count" value from the Results table
	close();

	// Compute ratio of spot number to nucleus number
	print(ratio);
}
