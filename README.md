# Tracking emission in high-speed images within ROI in shock compressed pressed particle-chip 

This code is a macro script designed for processing a set of images related to particle analysis, using the ImageJ/Fiji software. It performs the following tasks:

# 1. Initial Setup #

    - Clear Previous Results: Clears any existing results in the results table.
    
    - Directory Setup: Prompts the user to choose input and output directories for images and results.

# 2. Cropping Images #

    Image Selection and Cropping:
    
      -Iterates over a list of image files.
      
      -For each image, it opens the file, allows the user to manually select a region of interest (ROI) using an oval tool, and crops the image to this ROI.
      
      -This process is repeated for every 16 images (8 stationary and 8 time snapshots).
      
# 3. Image Processing # 
    -Background Subtraction and Noise Reduction:

        * Opens each image and applies background subtraction to enhance the image.
        
        * Additional processing options for noise removal are commented out but can be used if necessary.
        
    -Particle Detection:
    
        * Applies particle detection to identify and measure particles in the image.
        
        * Processes images using various steps like normalization, thresholding, and despeckling.
        
    -Measurement and Data Saving:

        * Measures particle properties (mean, modal, minimum values) for each detected particle.
        
        * Saves measurement results in CSV files, with filenames indicating the trial number and particle number.
        
# 4. Additional Measurements #

    Iterates through Time Snapshots:
        * For each detected ROI, it opens corresponding time snapshots, performs cropping and measurements, and saves the results.
        * This is repeated for each of the 8 time snapshots.
    
# 5. Final Cleanup #

    Close Open Windows: Ensures all open windows related to the results and ROI manager are closed to finalize the processing.

# Key Points: #

  - Manual and Automated Processing: The script combines manual ROI selection with automated image processing steps.
    
  - Batch Processing: Handles multiple images in batches, making it suitable for large datasets.
    
  - Data Management: Organizes and saves results in a structured manner for further analysis.
    
  - This script is particularly useful for analyzing particles in a series of images captured over time, extracting relevant metrics, and organizing results efficiently.
