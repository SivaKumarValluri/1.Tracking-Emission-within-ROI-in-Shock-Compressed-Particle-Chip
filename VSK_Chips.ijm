run("Clear Results"); // clear the results table of any previous measurements

//Data in the form of 8 raw stationary images before experiment and the 8 time snaps 
//at various instances of multiple trials in a single folder

//Reads the stationary image to give details of PBX chip(s) and the particles within the frame
//Applicable for cross-polarized images only


inputDirectory = getDirectory("Choose a Directory of Images");
fileList = getFileList(inputDirectory);
outputDirectory = getDirectory("Choose an output Directory");


//setBatchMode(true); 
//While-loop functions as 'Particles in PBX' Identifier within frame
//i=0; //Initializing 'no of trials' counter
i=0;
while (i < fileList.length)
{
    //Need to update scalebar based on image acquired 
    open(inputDirectory+fileList[i]);
    run("Set Scale...", "distance=258 known=100 unit=Micron global");
    run("Set Measurements...", "area center bounding fit shape redirect=None decimal=3");
   
   
	//setTool("rectangle");
	makeRectangle(512, 225, 528, 526);
	run("Crop");
	run("Make Circular Selection...", "radius=248"); //Change the radius of the circle as per your need 
	run("Crop");
	
	
	run("Particle Sizer");
	//setTool("rectangle");
	setOption("ScaleConversions", true);
	close();
	selectWindow("Segmentierung");
	run("Watershed");
    run("Analyze Particles...", "size=3.5-Infinity display exclude clear add in_situ");
    selectWindow("Results");
    saveAs("Results", outputDirectory+"Particle details in PBX for trial no. "+i+1+".csv");
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
    
    //First instance
    open(inputDirectory+fileList[i+8]);
    makeRectangle(512, 225, 528, 526);
	run("Crop");
	run("Make Circular Selection...", "radius=248"); //Change the radius of the circle as per your need 
	run("Crop");
	run("Set Measurements...", "mean modal min center redirect=None decimal=3");    
    PN = roiManager("Count");
    for (j=0; j < PN; j++)
    {
		roiManager("Select",j);
		run("Measure");
		selectWindow("Results");
		saveAs("Results", outputDirectory+"Trial no. "+(i+1)+" Particle no. "+(j+1)+" 1nd-instance.csv");
		if (isOpen("Results")) 
		  {
		    selectWindow("Results");
		    run("Close");
		  }  
    }
	selectWindow(fileList[i+8]);
	close();
	
	//Second instance
    open(inputDirectory+fileList[i+9]);
    makeRectangle(512, 225, 528, 526);
	run("Crop");
	run("Make Circular Selection...", "radius=248"); //Change the radius of the circle as per your need 
	run("Crop");
	run("Set Measurements...", "mean modal min center redirect=None decimal=3");   
    PN = roiManager("Count");
    for (j=0; j < PN; j++)
    {
		roiManager("Select",j);
		run("Measure");
		selectWindow("Results");
		saveAs("Results", outputDirectory+"Trial no. "+(i+1)+" Particle no. "+(j+1)+" 2nd-instance.csv");
		if (isOpen("Results")) 
		  {
		    selectWindow("Results");
		    run("Close");
		  }
    }    
    selectWindow(fileList[i+9]);
	close();

	//Third instance
    open(inputDirectory+fileList[i+10]);
    makeRectangle(512, 225, 528, 526);
	run("Crop");
	run("Make Circular Selection...", "radius=248"); //Change the radius of the circle as per your need 
	run("Crop");
	run("Set Measurements...", "mean modal min center redirect=None decimal=3");   
    PN = roiManager("Count");
    for (j=0; j < PN; j++)
    {
		roiManager("Select",j);
		run("Measure");
		selectWindow("Results");
		saveAs("Results", outputDirectory+"Trial no. "+(i+1)+" Particle no. "+(j+1)+" 3rd-instance.csv");
		if (isOpen("Results")) 
		  {
		    selectWindow("Results");
		    run("Close");
		  }
    }    
    selectWindow(fileList[i+10]);
	close();
    

	//Fourth instance
    open(inputDirectory+fileList[i+11]);
    makeRectangle(512, 225, 528, 526);
	run("Crop");
	run("Make Circular Selection...", "radius=248"); //Change the radius of the circle as per your need 
	run("Crop");
	run("Set Measurements...", "mean modal min center redirect=None decimal=3");   
    PN = roiManager("Count");
    for (j=0; j < PN; j++)
    {
		roiManager("Select",j);
		run("Measure");
		selectWindow("Results");
		saveAs("Results", outputDirectory+"Trial no. "+(i+1)+" Particle no. "+(j+1)+" 4th-instance.csv");
		if (isOpen("Results")) 
		  {
		    selectWindow("Results");
		    run("Close");
		  }
    }    
    selectWindow(fileList[i+11]);
	close();    
    
	//Fifth instance
    open(inputDirectory+fileList[i+12]);
    makeRectangle(512, 225, 528, 526);
	run("Crop");
	run("Make Circular Selection...", "radius=248"); //Change the radius of the circle as per your need 
	run("Crop");
	run("Set Measurements...", "mean modal min center redirect=None decimal=3");   
    PN = roiManager("Count");
    for (j=0; j < PN; j++)
    {
		roiManager("Select",j);
		run("Measure");
		selectWindow("Results");
		saveAs("Results", outputDirectory+"Trial no. "+(i+1)+" Particle no. "+(j+1)+" 5th-instance.csv");
		if (isOpen("Results")) 
		  {
		    selectWindow("Results");
		    run("Close");
		  }
    }    
    selectWindow(fileList[i+12]);
	close();    
    
	//Sixth instance
    open(inputDirectory+fileList[i+13]);
    makeRectangle(512, 225, 528, 526);
	run("Crop");
	run("Make Circular Selection...", "radius=248"); //Change the radius of the circle as per your need 
	run("Crop");
	run("Set Measurements...", "mean modal min center redirect=None decimal=3");   
    PN = roiManager("Count");
    for (j=0; j < PN; j++)
    {
		roiManager("Select",j);
		run("Measure");
		selectWindow("Results");
		saveAs("Results", outputDirectory+"Trial no. "+(i+1)+" Particle no. "+(j+1)+" 6th-instance.csv");
		if (isOpen("Results")) 
		  {
		    selectWindow("Results");
		    run("Close");
		  }
    }    
    selectWindow(fileList[i+13]);
	close();      

	//Seventh instance
    open(inputDirectory+fileList[i+14]);
    makeRectangle(512, 225, 528, 526);
	run("Crop");
	run("Make Circular Selection...", "radius=248"); //Change the radius of the circle as per your need 
	run("Crop");
	run("Set Measurements...", "mean modal min center redirect=None decimal=3");   
    PN = roiManager("Count");
    for (j=0; j < PN; j++)
    {
		roiManager("Select",j);
		run("Measure");
		selectWindow("Results");
		saveAs("Results", outputDirectory+"Trial no. "+(i+1)+" Particle no. "+(j+1)+" 7th-instance.csv");
		if (isOpen("Results")) 
		  {
		    selectWindow("Results");
		    run("Close");
		  }
    }    
    selectWindow(fileList[i+14]);
	close();  
	
	//Eigth instance
    open(inputDirectory+fileList[i+15]);
    makeRectangle(512, 225, 528, 526);
	run("Crop");
	run("Make Circular Selection...", "radius=248"); //Change the radius of the circle as per your need 
	run("Crop");
	run("Set Measurements...", "mean modal min center redirect=None decimal=3");   
    PN = roiManager("Count");
    for (j=0; j < PN; j++)
    {
		roiManager("Select",j);
		run("Measure");
		selectWindow("Results");
		saveAs("Results", outputDirectory+"Trial no. "+(i+1)+" Particle no. "+(j+1)+" 8th-instance.csv");
		if (isOpen("Results")) 
		  {
		    selectWindow("Results");
		    run("Close");
		  }
    }    
    selectWindow(fileList[i+15]);
	close();  
	 	        
    //Closing ROI manager at the end of processing the last trial                  
	i=i+16; // 8 stationary and 8 instances jumped
	if(isOpen("ROI Manager"))
	{
		selectWindow("ROI Manager");
		run("Close");
	} 

}

setBatchMode(false); 




close("*");

if (isOpen("Results")) 
  {
    selectWindow("Results");
    run("Close");
  }