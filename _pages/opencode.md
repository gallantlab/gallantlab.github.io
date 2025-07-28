---
layout: page
title: code
permalink: /opencode/
description: 
nav: true
nav_order: 6
---

<div class="code-entry">
  <div class="code-image">
    <img src="/assets/img/other/github.jpg" alt="github" class="img-fluid">
  </div>
  <div class="code-info">
    Our <a href="https://github.com/gallantlab">github repository</a> contains lots of open code that may be useful for scientific computing in general, or for fitting encoding models to fMRI or neurophysiology data sets.
  </div>
</div>

<div class="code-entry">
  <div class="code-image">
    <img src="/assets/img/other/himalaya.jpg" alt="himalaya" class="img-fluid">
  </div>
  <div class="code-info">
    <a href="https://github.com/gallantlab/himalaya">Himalaya</a> implements machine learning linear(ized) models in Python, focusing on computational efficiency for large numbers of targets. Himalaya efficiently estimates linear(ized) models on large numbers of targets (for example, thousands of voxels in an fMRI experiment), it runs on both CPU and GPU hardware, and it provides estimators that are compatible with scikit-learn's API. Himalaya is routinely used in our lab to fit voxelwise encoding models to very large fMRI data sets. A paper describing Himalaya can be found <a href="https://www.sciencedirect.com/science/article/pii/S1053811922008497">here</a>.
  </div>
</div>

<div class="code-entry">
  <div class="code-image">
    <img src="/assets/img/other/pycortex.jpg" alt="pycortex" class="img-fluid">
  </div>
  <div class="code-info">
    <a href="https://github.com/gallantlab/pycortex">Pycortex</a> is a python-based toolkit for surface visualization of fMRI data. (It can also be used to visualize other types of volumetric brain data.) The brain viewers on this site were all generated using Pycortex. The 2015 publication describing Pycortex can be found <a href="https://www.frontiersin.org/articles/10.3389/fninf.2015.00023/full">here</a>. Documentation for Pycortex can be found <a href="https://gallantlab.org/pycortex/">here</a>.
  </div>
</div>

<div class="code-entry">
  <div class="code-image">
    <img src="/assets/img/other/cottoncandy.jpg" alt="cottoncandy" class="img-fluid">
  </div>
  <div class="code-info">
    <a href="https://github.com/gallantlab/cottoncandy">CottonCandy</a> is a scientific library for storing and accessing numpy array data on an S3-compatible cloud storage instance. This is achieved by reading arrays from memory and downloading arrays directly into memory. This means that you don't have to download your array to disk, and then load it from disk into your python session. A paper describing CottonCandy can be found <a href="https://joss.theoj.org/papers/10.21105/joss.00890.pdf">here</a>.
  </div>
</div>
