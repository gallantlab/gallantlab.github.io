---
title: "Learn"
description: "Voxelwise Encoding Model tutorials and resources"
menu: "main"
weight: 5
hide_title: true
---

## Learn About the Lab Philosophy

If you would like to know more about the general philosophy of the lab, please listen to this [Freakonomics podcast interview with Jack Gallant](https://freakonomics.com/podcast/this-is-your-brain-on-podcasts/) or to these OHBM discussions between Peter Bandettini and Jack Gallant ([discussion 1](https://www.youtube.com/watch?v=cKmGF3REyuA&list=PLEJ899jsgdRoMWrUhwBsP7-R_DsfIkRFk&index=5), [discussion 2](https://www.youtube.com/watch?v=skX7tzWxwFk)).

## Learn About Voxelwise Encoding Models

{{< content-card title="Voxelwise Encoding Model review paper" url="https://www.psyarxiv.com/nt2jq" image="/img/papers/ViscontidOC.Deniz.2025.webp" alt="Voxelwise Encoding Model guide" description="This review paper provides the first comprehensive guide to the Voxelwise Encoding Model (VEM) framework. The VEM framework is a framework for fitting encoding models to fMRI data. This framework is currently the most sensitive and powerful approach available for modeling fMRI data. It can be used to fit dozens of distinct models simultaneously, each model having up to several thousand distinct features. The Voxelwise Encoding Model framework also conforms to all best practices in data science, which maximizes sensitivity, reliability and generalizability of the resulting models." >}}

{{< content-card title="Voxelwise Encoding Model tutorials" url="https://gallantlab.org/voxelwise_tutorials" image="/img/other/learn.vm.webp" alt="Voxelwise Encoding Model tutorials" description="These Python tutorials show how to fit, evaluate, and interpret voxelwise encoding models on one of our public available datasets. We are providing these online tutorials here as a service to the fMRI community." >}}

{{< content-card title="Voxelwise Encoding Model workshop video" url="https://www.youtube.com/watch?v=jobQmEJpbhY" image="/img/other/learn.workshop.webp" alt="Voxelwise Encoding Model CCN workshop" description="At the 2021 CCN meeting we held a keynote and tutorials session on the Voxelwise Encoding Model framework. You can find a video recording of the workshop here." >}}

{{< content-card title="Theory paper focusing on feature space selection and banded ridge regression." date="2022-12-01" url="https://www.sciencedirect.com/science/article/pii/S1053811922008497" image="/img/papers/DuprelaTour.T.2022.webp" alt="Dupré la Tour 2022" description="Encoding models identify the information represented in brain recordings, but fitting multiple models simultaneously presents several challenges. This paper (Dupré la Tour et al., Neuroimage, 2022) describes how banded ridge regression can be used to solve these problems. Furthermore, several methods are proposed to address the computational challenge of fitting banded ridge regressions on large numbers of voxels and feature spaces. All implementations are released in an open-source Python package called Himalaya." >}}

{{< content-card title="System identification review for sensory neuroscience" url="https://doi.org/10.1146/annurev.neuro.29.051605.113024" image="/img/papers/Wu.David.Gallant.2006.webp" alt="Wu, David & Gallant 2006 system identification overview" description="This review paper (Wu, David & Gallant, Annual Review of Neuroscience, 2006) provides a comprehensive introduction to system identification methods for sensory neuroscience. The paper shows how many different algorithms used in sensory neurophysiology can be viewed as variants of a single statistical inference problem: maximum a posteriori (MAP) estimation. It covers practical issues including stimulus selection, model estimation, regularization, visualization, and prediction-based validation. This paper provides the theoretical foundation for the encoding model framework used in the Gallant Lab." >}}
