---
title: "Code"
description: "Open source code from Gallant Lab"
menu: "main"
weight: 6
---

{{< content-card
  title="GitHub repository"
  url="https://github.com/gallantlab"
  image="/img/other/github.webp"
  alt="github"
  description="Our github repository contains lots of open code that may be useful for scientific computing in general, or for fitting encoding models to fMRI or neurophysiology data sets."
>}}

{{< content-card
  title="Himalaya"
  url="https://github.com/gallantlab/himalaya"
  image="/img/other/himalaya.webp"
  alt="himalaya"
  description="Himalaya implements machine learning linear(ized) models in Python, focusing on computational efficiency for large numbers of targets. Himalaya efficiently estimates linear(ized) models on large numbers of targets (for example, thousands of voxels in an fMRI experiment), it runs on both CPU and GPU hardware, and it provides estimators that are compatible with scikit-learn's API. Himalaya is routinely used in our lab to fit voxelwise encoding models to very large fMRI data sets. A paper describing Himalaya can be found <a href='https://www.sciencedirect.com/science/article/pii/S1053811922008497'>here</a>."
>}}

{{< content-card
  title="Pycortex"
  url="https://github.com/gallantlab/pycortex"
  image="/img/other/pycortex.webp"
  alt="pycortex"
  description="Pycortex is a python-based toolkit for surface visualization of fMRI data. (It can also be used to visualize other types of volumetric brain data.) The brain viewers on this site were all generated using Pycortex. The 2015 publication describing Pycortex can be found <a href='https://www.frontiersin.org/articles/10.3389/fninf.2015.00023/full'>here</a>. Documentation for Pycortex can be found <a href='https://gallantlab.github.io/pycortex/'>here</a>."
>}}

{{< content-card
  title="CottonCandy"
  url="https://github.com/gallantlab/cottoncandy"
  image="/img/other/cottoncandy.webp"
  alt="cottoncandy"
  description="CottonCandy is a scientific library for storing and accessing numpy array data on an S3-compatible cloud storage instance. This is achieved by reading arrays from memory and downloading arrays directly into memory. This means that you don't have to download your array to disk, and then load it from disk into your python session. A paper describing CottonCandy can be found <a href='https://joss.theoj.org/papers/10.21105/joss.00890.pdf'>here</a>."
>}}
