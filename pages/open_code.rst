.. title: OpenCode
.. slug: open_code
.. date: 2023-03-24 23:52:52 UTC-07:00
.. tags: software, open source, python, fmri
.. category: neuroscience
.. link: 
.. description: 
.. type: text

.. list-table:: 
  :header-rows: 0

  * - .. image:: /images/other/pycortex.png
    - `Pycortex interactive brain viewer. 
      <https://github.com/gallantlab/pycortex>`_
      Pycortex is a python-based toolkit for surface visualization
      of fMRI data. (It can also be used to visualize other types
      of volumetric brain data.) The brain viewers on this site were
      all generated using Pycortex. The 2015 publication describing 
      Pycortex can be found 
      `here. 
      <https://www.frontiersin.org/articles/10.3389/fninf.2015.00023/full>`_

  * - .. image:: /images/other/cottoncandy.png
    - `CottonCandy, syntactic sugar for S3. 
      <https://github.com/gallantlab/cottoncandy>`_
      A scientific library for storing and accessing numpy array 
      data on an S3-compatible cloud storage instance. This is achieved 
      by reading arrays from memory and downloading arrays directly 
      into memory. This means that you don't have to download your array 
      to disk, and then load it from disk into your python session.
      A paper describing CottonCandy was published in
      `2018. 
      <https://joss.theoj.org/papers/10.21105/joss.00890.pdf>`_

  * - .. image:: /images/other/himalaya.png
    - `Himalaya linear(ized) modeling package. 
      <https://github.com/gallantlab/himalaya>`_
      Himalaya implements machine learning linear(ized) models in
      Python, focusing on computational efficiency for large numbers 
      of targets. Himalaya efficiently estimates linear(ized) models
      on large numbers of targets (for example, thousands of voxels in an
      fMRI experiment), it runs on both CPU and GPU hardware, and it
      provides estimators that are compatible with scikit-learn's API.
      Himalaya is routinely used in our lab to fit voxelwise encoding
      models to very large fMRI data sets. The 2022 publication
      describing Himalaya is at this
      `link. 
      <https://www.sciencedirect.com/science/article/pii/S1053811922008497>`_

  * - .. image:: /images/other/himalaya.png
    - `Voxelwise modeling tutorials.
      <https://github.com/gallantlab/voxelwise_tutorials>`_
      Voxelwise modeling is a framework for fitting linear(ized)
      encoding models to functional magnetic resonance imaging (fMRI)
      datasets. Voxelwise modeling can produce high-resolution,
      high-dimensional functional brain maps in single individuals,
      while minimizing problems due to Type 1 and Type 2 error that are
      common in other approaches to fMRI data analysis.
