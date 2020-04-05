# HackArizona2020
This repository contains my `MindfulDrivers` (not a very original name I suppose) machine learning model that won Amazon's category 
for Most Impactful use of Driven Data at Hack Arizona 2020.

### The Model
This project is based on and builds on a the `DistractedDrivers` project I completed in at the InspiritAI Scholars program.
It uses a transfer leaning model based on `VGG16` and shows off better architecture planning and pruning in `Keras` as well as
data visualisation through `Matplotlib` and `Seaborn`. More importantly, this project discusses the possible applications of these trends.

It has a Categorial Accuracy (across 4 categories) of 88% and a Binary Accuracy of 96%.

My team and I also ported this code into a `Sagemaker` Jupyter notebook (`Tensorflow 3.6`) in `AWS` successfully at the Hackathon and
created a local Python application (Using `Boto3`) to run data through the `AWS` model in the cloud.

### Saliencies
An important part of this project is the potential applications of the data trends observed to imrpove community safety in general. 
These saliencies are discussed in the presentation attached along with a very very brief explanation of the model.

For the Hackathon, I reused the InspiritAI database, but it should be quite simple to replace the database and apply the same overall model.

### Notes
The `AWS` environment (at the time of the Hackathon in Jan 2020) did use an older backend, so the model runs much slower on `AWS` than `Colab`. The model used in the port
is almost the exact same, so I will not be including the `AWS` model and its local app in this repository.


