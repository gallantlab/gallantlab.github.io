---
title: "Brain Decoding: Frequently Asked Questions"
date: 2026-05-31
author: "Jack Gallant"
featured_image: "/img/other/sulcigyri.webp"
tags: ["brain decoding", "fMRI", "FAQ"]
aliases: ["/blog/2026-05-31-brain-reading-faq/"]
---

One of the major research areas in our laboratory concerns noninvasive "brain decoding". Here are a few answers to the most common questions.

### What is the goal of brain decoding research?

There are two main motivations for brain decoding research. First, many scientists and engineers seek to develop brain-machine or brain-computer interfaces that can be used to solve problems in the real world, such as the control of a prosthetic limb. Practical brain decoding devices would have wide applicability in many fields, including communication, medical diagnosis and entertainment. The second motivation for brain decoding research is that it can serve as a useful adjunct to basic research in cognitive neuroscience: one way to test whether some part of the brain contains a specific type of information is to see whether that information can be decoded from brain activity.

### What types of brain decoding are currently possible?

It is useful to distinguish between three types of brain decoding: classification, identification and reconstruction. In classification we try to determine which one of several possible brain states a person is in. For example, a decoder might be designed to classify whether a person is happy or sad.

In identification we try to determine which specific stimulus a person has seen, heard or imagined, when the item has been drawn from a known list. For example, an internal speech decoder might identify an imagined, covertly spoken word that was drawn from a finite vocabulary of a few thousand words.

In reconstruction we try to reconstruct the stimulus that a person saw, heard or imagined, even if the item is completely novel and has never been seen before. For example, a dream decoder might reconstruct the entire visual and auditory experience of a dream.

### What equipment is required for brain decoding?

At this time non-invasive approaches to brain decoding include functional MRI (fMRI), magneto-encephalography (MEG), electro-encephalography (EEG), functional near infra-red spectroscopy/diffuse optical tomography (fNIRS-DOT), or ultrasound. These methods have different advantages and disadvantages, and are most appropriate for different kinds of applications. Functional MRI can recover a wide range of different kinds of information from the brain, and at high spatial resolution. fNIRS-DOT measures the same signals as fMRI, but with lower spatial resolution. MEG and EEG have much higher temporal resolution than fMRI, but they also have lower spatial resolution.

Although fMRI provides the best non-invasive measures of brain activity (and so the best decoding), it is an extremely expensive technique that requires a very large magnet housed in a shielded room. Therefore, future brain decoding devices that are both portable and non-invasive will be based on other technologies, such as fNIRS-DOT, EEG, or ultrasound.

Brain decoding can also be performed invasively by placing electrodes between the skull and the surface of the brain, or by inserting them directly into the brain. However, these invasive techniques are unlikely to be used except in rare medical situations where an invasive surgery might provide significant improvement in life quality.

### How does a typical brain decoding experiment work?

There are several different approaches to brain decoding, and each uses different procedures. Our laboratory typically uses a two step procedure. The first step of the process is to create a set of encoding models that quantify the relationship between specific stimuli, tasks, or subjective states (e.g. imagery, dreams, internal speech) and measured brain activity. The assumption here is that brain activity measurements are systematically related to specific mental states.

The second step of the problem is to use the fit encoding models to decode brain activity. This involves inverting the encoding model to map from brain activity back into stimuli, tasks, or subjective states. One possible way to do this is to consider all possible stimuli, tasks, and mental states as potential reconstructions. To determine if a particular candidate is an accurate reconstruction, we can use the encoding models to determine the likelihood that that candidate would evoke the brain activity that was actually measured. Prior information about the distribution of possible stimuli, tasks, and mental states can also be used to improve reconstruction. Both of these sources of information are used to converge on a reconstruction that is as accurate as possible, given the measured brain activity.

### What are the limitations on brain decoding?

Brain decoding performance depends primarily on the quality of brain activity measurements. At this time the best way to measure brain activity is with functional MRI (fMRI). However, fMRI does not actually measure the activity of neurons. Instead, it measures blood flow consequent to neural activity. Many studies have shown that the blood flow signals measured using fMRI are generally correlated with neural activity. However, fMRI has relatively modest spatial and temporal resolution, so much of the information contained in the underlying neural activity is lost. fMRI measurements are also quite variable from trial-to-trial, due to changes in blood pressure, breathing rate, etc. Both of these factors limit the amount of information that can be decoded from fMRI measurements.

Decoding also depends critically on our understanding of how the brain represents the specific kind of information that is to be decoded. Neuroscientists probably understand the human visual system better than any other part of the human brain, so decoding of visual perception or imagery works fairly well. We are quickly gaining a good understanding of language processing, so decoding of language comprehension and language production (including internal speech) also works rather well. Our understanding of more abstract aspects of thought is relatively poor, so it is more difficult to decode those kinds of processes.

### What are the future applications of this technology?

There are many potential applications of devices that can decode brain activity. In addition to its value as a basic research tool, brain decoding could be used to aid in diagnosis of diseases (e.g., stroke, dementia); to assess the effects of therapeutic interventions (drug therapy, stem cell therapy); or for control of a prosthetic. It could also be used to build a brain-machine interface, as described below.

### Will it ever be possible to decode dreams, memory, and visual imagery?

Neuroscientists generally assume that all mental processes have a concrete neurobiological basis. Therefore, as long as we have good measurements of brain activity and good computational models of the brain, it should be possible in principle to decode the content of mental processes like dreams, memory, and imagery. However, current computational models of perception have been developed to account for the perception of natural scenes and natural language. The accuracy of these models for decoding subjective states such as dreaming and imagination will depend on how similar those processes are to normal perception. This is an active topic of research in our lab and in many other labs.

### Will it ever be possible to use this technology in detective work, court cases, trials, etc?

The potential use of this technology in the legal system is problematic. Many psychology studies have demonstrated that eyewitness testimony is notoriously unreliable. Witnesses often have poor memory but often do not realize that their memory is poor; their recollections tend to be biased by intervening events, inadvertent coaching, and rehearsal (prior recall); and they often confabulate stories to make logical sense of events that they cannot recall well. These errors are thought to stem from several factors: poor initial storage of information in memory; changes to stored memories over time; and faulty recall. Any brain decoding device that aims to decode stored memories will inevitably be limited not only by the technology itself, but also by the quality of the stored information (an accurate read-out of a faulty memory only provides misleading information). Therefore, any future application of this technology in the legal system will have to be considered with extreme caution.

### Will we ever be able to use this technology to insert images (or movies) directly into the brain?

Not in the foreseeable future. Noninvasive devices such as ultrasound can be used to alter mental activity in a relatively uncontrolled way, but there is no known technology that can remotely send signals to the brain in a way that would be organized enough to elicit a specific mental state. However, noninvasive methods might be used to alter brain activity more generally. For example, a few recent studies have suggested that noninvasive methods can be used to augment learning, or to change mood.

### Can brain decoding be performed remotely or covertly, without an individual's knowledge?

No, brain decoding cannot be performed remotely, and it cannot be performed without the knowledge of the subject. Brain decoding requires that brain activity be measured at fairly high spatial and temporal resolution. At this time there are no brain decoding technologies that can record brain activity remotely at a resolution sufficient to decode mental activity. All successful brain decoding experiments use devices such as fMRI machines, MEG machines or EEG recording arrays that must be placed in close proximity to the brain. These devices are quite large (for example, an fMRI machine weighs several tons), and they would certainly be noticed if they were being used. Furthermore, any small movements such as head motion, blinking or coughing will dramatically reduce the quality of the brain activity measurements. Therefore, all these technologies require the cooperation of the individual whose brain activity is being measured.

### What are the ethical and privacy issues that stem from brain decoding?

Current methods for decoding brain activity are relatively primitive. Current computational models are immature, and in order to construct a good model of someone's brain function they must spend many hours in a large, stationary MRI scanner. That said, both the technology for measuring brain activity and the computational models are improving continuously. It is possible that decoding brain activity could have serious ethical and privacy implications downstream in, say, the 20- to 50-year time frame. As an analogy, consider the current debates regarding availability of genetic information. Genetic sequencing is becoming cheaper by the year, and it is now possible for individuals to have their own genome sequenced. This raises many issues regarding privacy and the accessibility of individual genetic information. We believe strongly that no one should ever be subjected to any form of brain-decoding process involuntarily, covertly, or without complete informed consent.
