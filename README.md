# Coronary Artery Reconstruction Tools

[![Open in Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/oxylike0830-dot/supplementary-code/HEAD?urlpath=lab/tree/test_1_supplement.ipynb)

This repository contains supplementary Python code and sample data for coronary
artery reconstruction and post-processing workflows.

The code is based on the method described in:

**Athanasiou LS, Bourantas CV, Siogkas PK, et al.**
*3D reconstruction of coronary arteries using frequency domain optical coherence
tomography images and biplane angiography.*
Proceedings of the IEEE Engineering in Medicine and Biology Society (EMBC),
2012 Annual International Conference. San Diego (CA): IEEE; 2012. p. 2647-2650.
[Link to publication](https://ieeexplore.ieee.org/abstract/document/6346508/)

**Original authors**: Athanasiou LS, Bourantas CV, Siogkas PK, et al.
**Institutions**: University of Innsbruck, Castle Hill Hospital

## License And Permissions

**Original license**: Not specified in the original GitHub repository.
**Current usage**: Code was used and modified with explicit permission from the
original author, Dr. Athanasiou, for academic research purposes only.

## Modified Workflow

The following changes were made to adapt the code to a CTCA + OCT-based workflow:

- Modified the data preprocessing pipeline to use CT coronary angiography instead of angiography.
- Refined OCT lumen border placement logic.
- Integrated a semi-automatic MATLAB segmentation step based on open-source code.

## Workflow Summary

1. CT coronary angiography images were segmented using DicomViewer Pro v2.11.
2. Segmented 3D models were exported to VMTK for main-vessel and side-branch centerline extraction.
3. Extracted centerline data were converted to the format expected by this reconstruction code.
4. OCT frame lumen borders were segmented using an adapted MATLAB script from [dmolony3/OCT](https://github.com/dmolony3/OCT).
5. `test_1_supplement.ipynb` generates STL models and coordinate datasets.
6. CFD results exported as EnSight Gold can be visualized in ParaView, and `heatmap.ipynb` can be used for hemodynamic heatmaps.

## Python Version

Use Python 3.11.10. The dependency files in this repository are pinned for
Python 3.11 to reduce library conflicts on other computers.

## Quick Start On Windows

1. Install [Python 3.11](https://www.python.org/downloads/release/python-31110/).
2. Download or clone this repository.
3. Double-click `start_jupyter.bat`.
4. When JupyterLab opens, run `test_1_supplement.ipynb` or `heatmap.ipynb`.

The first run creates a local `.venv` folder and installs the required packages.
Later runs reuse the same environment.

## No-Install Cloud Option For Reviewers

Reviewers who do not have Python installed can use Binder:

1. Click the **Open in Binder** badge at the top of this README.
2. Wait for Binder to build and launch the environment. The first launch can take several minutes.
3. In JupyterLab, run `test_1_supplement.ipynb` or open `heatmap.ipynb`.

Binder runs in a temporary cloud session, so files generated there are not saved
back to GitHub automatically. Download any outputs from JupyterLab before closing
the browser tab.

## Manual Setup With pip

```bash
python -m venv .venv
.venv\Scripts\activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m jupyter lab
```

On macOS or Linux:

```bash
python3.11 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m jupyter lab
```

## Manual Setup With Conda

```bash
conda env create -f env/environment.yml
conda activate paper-supp
jupyter lab
```

If the environment already exists:

```bash
conda env update -f env/environment.yml --prune
conda activate paper-supp
```

## Notebooks

- `test_1_supplement.ipynb`: reconstruction workflow using the sample data.
- `heatmap.ipynb`: heatmap generation and visualization workflow.

## Notes

- The sample data are kept under `data/sample/`.
- Generated outputs should be placed under `outputs/` or `figures/`; these folders are ignored by Git.
- If package installation fails, check that Python 3.11 is being used. Python 3.12+ may select different package versions.
