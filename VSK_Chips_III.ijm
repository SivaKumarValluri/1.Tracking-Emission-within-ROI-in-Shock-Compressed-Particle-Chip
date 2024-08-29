run("Clear Results"); // clear the results table of any previous measurements

//Data in the form of 8 raw stationary images before experiment and the 8 time snaps 
//at various instances of multiple trials in a single folder

//Reads the stationary image to give details of PBX chip(s) and the particles within the frame
//Applicable for cross-polarized images only


inputDirectory = getDirectory("Choose a Directory of Images");
fileList = getFileList(inputDirectory);
outputDirectory = getDirectory("Choose an output Directory");
outputDirectory2 = getDirectory("Choose an output Directory for cropped images");
i=0
while (i < fileList.length)
{
   
    //User input to crop the section of image useful for analysis
    open(inputDirectory+fileList[i]);          
    setTool("oval");
    waitForUser("Waiting for user to draw an oval around field of view");
    roiManager("Add");
    run("Crop");
	i=i+16; // 8 stationary and 8 instances jumped
}



if(isOpen("ROI Manager"))
{
	selectWindow("ROI Manager");
	run("Close");
} 

//While-loop functions as 'Particles in PBX' Identifier within frame
//i=0; //Initializing 'no of trials' counter
i=0;
k=0;
while (i < fileList.length)
{
   
    //User input to crop the section of image useful for analysis
    open(inputDirectory+fileList[i]);          
    setTool("oval");
    waitForUser("Waiting for user to draw an oval around field of view");
    roiManager("Add");
    run("Crop");
	
        
    //Automated section        
    selectWindow(fileList[i]);	
    rename("original");
	
	//run("Normalize Local Contrast", "block_radius_x=40 block_radius_y=40 standard_deviations=3 center stretch");
	run("Subtract Background...", "rolling=1 sliding");
	//run("Remove Outliers...", "radius=4 threshold=10 which=Dark");
	//run("Remove Outliers...", "radius=4 threshold=100 which=Bright");

	
	//run("Duplicate...", "title=duplicate");
	//run("Gaussian Blur...", "sigma=10");
	//imageCalculator("Subtract create", "original","duplicate");
	//selectWindow("Result of original");
	//rename("Processed");
	//close("duplicate");
	//close("original");

	//Thresholding by user input
	//run("Threshold...");  // open Threshold tool
	//title = "WaitForUserDemo";
	//msg = "If necessary, use the \"Threshold\" tool to\nadjust the threshold, then click \"OK\".";
	//waitForUser(title, msg);
	//selectImage("Processed");  //make sure we still have the same image
	//getThreshold(lower, upper);
	
	//run("Invert");
	//run("Despeckle");

	//Identifying 'particle' regions	
	run("Particle Sizer");
	setTool("rectangle");
	setOption("ScaleConversions", true);
	close();
	close("original");
	selectWindow("Segmentierung");
	run("Irregular Watershed", "erosion=1000 convexity_threshsold=100");
    run("Analyze Particles...", "size=0-Infinity display exclude clear add in_situ");
    
    selectWindow("Results");
    saveAs("Results", outputDirectory+"Particle details in PBX chip for trial no. "+k+1+".csv");
	if (isOpen("Exception"))
	  {
	    selectWindow("Exception");
	    run("Close");
	  }
	if (isOpen("Console"))
	  {
	    selectWindow("Console");
	    run("Close");
	  }
	if (isOpen("Log"))
	  {
	    selectWindow("Log");
	    run("Close");
	  }
	if (isOpen("Results")) 
	  {
	    selectWindow("Results");
	    run("Close");
	  }
    close("*");

   	PN = roiManager("Count");
    for (j=0; j < PN; j++)  //First ROI is rectangle and next is circle so we skip over them
    {
    	//First
    	open(outputDirectory2+fileList[i+8]);
	    roiManager("Select",0);
		run("Crop");
		run("Set Measurements...", "mean modal min center redirect=None decimal=3"); 
		roiManager("Select",j);
		run("Measure");
		selectWindow(fileList[i+8]);
		close();
		//Second
		open(outputDirectory2+fileList[i+9]);
	    roiManager("Select",0);
		run("Crop");
		run("Set Measurements...", "mean modal min center redirect=None decimal=3"); 
		roiManager("Select",j);
		run("Measure");
		selectWindow(fileList[i+9]);
		close();
		//Third
		open(outputDirectory2+fileList[i+10]);
	    roiManager("Select",0);
		run("Crop");
		run("Set Measurements...", "mean modal min center redirect=None decimal=3"); 
		roiManager("Select",j);
		run("Measure");
		selectWindow(fileList[i+10]);
		close();
		//Fourth
		open(outputDirectory2+fileList[i+11]);
	    roiManager("Select",0);
		run("Crop");
		run("Set Measurements...", "mean modal min center redirect=None decimal=3"); 
		roiManager("Select",j);
		run("Measure");
		selectWindow(fileList[i+11]);
		close();
		//Fifth
		open(outputDirectory2+fileList[i+12]);
	    roiManager("Select",0);
		run("Crop");
		run("Set Measurements...", "mean modal min center redirect=None decimal=3"); 
		roiManager("Select",j);
		run("Measure");
		selectWindow(fileList[i+12]);
		close();
		//Sixth
		open(outputDirectory2+fileList[i+13]);
	    roiManager("Select",0);
		run("Crop");
		run("Set Measurements...", "mean modal min center redirect=None decimal=3"); 
		roiManager("Select",j);
		run("Measure");
		selectWindow(fileList[i+13]);
		close();
		//Seventh
		open(outputDirectory2+fileList[i+14]);
	    roiManager("Select",0);
		run("Crop");
		run("Set Measurements...", "mean modal min center redirect=None decimal=3"); 
		roiManager("Select",j);
		run("Measure");
		selectWindow(fileList[i+14]);
		close();
		//Eighth
		open(outputDirectory2+fileList[i+15]);
	    roiManager("Select",0);
		run("Crop");
		run("Set Measurements...", "mean modal min center redirect=None decimal=3"); 
		roiManager("Select",j);
		run("Measure");
		selectWindow(fileList[i+15]);
		close();
		
		//Saving data
		selectWindow("Results");
		saveAs("Results", outputDirectory+"Trial no. "+(k+1)+" Particle no. "+(j-1)+" out of "+ (PN) +" .csv");
		
		if (isOpen("Results")) 
		  {
		    selectWindow("Results");
		    run("Close");
		  }
    }

        
    //Closing ROI manager at the end of processing the last trial                  
	i=i+16; // 8 stationary and 8 instances jumped
	k=k+1; //Title
	if(isOpen("ROI Manager"))
	{
		selectWindow("ROI Manager");
		run("Close");
	} 

}






close("*");

if (isOpen("Results")) 
  {
    selectWindow("Results");
    run("Close");
  }