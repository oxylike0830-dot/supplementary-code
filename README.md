# Coronary Artery Reconstruction Tools

This code is based on the method described in:

**Athanasiou LS, Bourantas CV, Siogkas PK, et al.**  
*3D reconstruction of coronary arteries using frequency domain optical coherence tomography images and biplane angiography.*  
Proceedings of the IEEE Engineering in Medicine and Biology Society (EMBC), 2012 Annual International Conference. San Diego (CA): IEEE; 2012. p. 2647–2650.  
[Link to publication](https://ieeexplore.ieee.org/abstract/document/6346508/)

**Original authors**: Athanasiou LS, Bourantas CV, Siogkas PK, et al.  
**Institutions**: University of Innsbruck, Castle Hill Hospital

### License and Permissions

**Original license**: Not specified in the original GitHub repository  
**Current usage**: Code was used and modified with **explicit permission from the original author (Dr. Athanasiou)**, for **academic research purposes only**.

---

## 🔧 Modifications to the Original Code

The following changes were made to adapt the code to a CTCA + OCT-based workflow:

- Modified the data preprocessing pipeline (using CT coronary angiography instead of angiography)
- Refined OCT lumen border placement logic
- Integrated a semi-automatic MATLAB segmentation step (based on open-source code)

---

## 🧪 Workflow Summary

### 1. CTCA Segmentation  
CT coronary angiography (CTCA) images were segmented using **DicomViewer Pro v2.11** (Inobitec, Voronezh, Russia).

### 2. Centerline Extraction  
Segmented 3D models were exported to **VMTK** (Orobix Srl, Bergamo, Italy), where centerlines of the main vessel and side branches were extracted.

### 3. Centerline Formatting  
Extracted centerline data were processed into a format compatible with the reconstruction code.

### 4. OCT Lumen Segmentation  
Each OCT frame's lumen was segmented using a **semi-automated MATLAB script**, adapted from an open-source GitHub project:  
[https://github.com/dmolony3/OCT](https://github.com/dmolony3/OCT)  
Contours were overlaid on grayscale OCT frames (as blue lines), matching the sample data format.

### 5. Post-Processing and CFD Pipeline  
- For each patient, `test_1_supplement.ipynb` was run individually to generate STL models and coordinate datasets.
- The STL files were imported into **ANSYS Fluent** for computational fluid dynamics (CFD) simulations.
- CFD results were exported as **EnSight Gold** format and visualized using **ParaView**.
- Custom macros and Python scripts were used to generate final hemodynamic heatmaps. (heatmap.ipynb)


### Python Version
This project requires Python 3.11.10.

### Installation

To install the required dependencies, run:

pip install -r requirements.txt
