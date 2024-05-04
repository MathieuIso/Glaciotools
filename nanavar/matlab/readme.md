This toolbox contains a modified version of the Allan Standard Deviation calculation that can take into account missing values (included as NaN). In the current version, regular sampling of the input time series is still needed.

Here, we evaluate the impact of missing datapoints on the Allan SD estimator. To do so, we use a synthetic variable y combining a white noise, a red noise, and a trend. We add different amounts and structure of missing datapoints as NaN on this variable y and create sets of ynan. We compute the Allan SD on y and ynan in these case studies.

First, we consider single missing datapoints regularly spread in the dataset (Figure 1). We include one NaN every 10, 8, 6, 4, and 2 datapoints (practically, in the latter case it is recommended to resample your dataset at half the resolution rather than computing the Allan SD with the original dataset). With regular missing datapoints, the Allan SD estimator suffers systematic underestimation of the Allan SD from the original dataset. The obtained values remain qualitatively accurate (r²>0.9) until 50% of the datapoints are missing, when the accuracy of the estimator is strongly decreased.

<img src="https://github.com/MathieuIso/Glaciotools/assets/168548936/45a9c74d-5ab4-4963-ab09-6db99566cc88" width="474" height="489">

_Figure 1: Datasets and Allan SD estimation for increasing number of regularly spaced single missing datapoints (every 10, 8, 6, 4, 2 points, in orange, yellow, purple, green, and blue, respectetively). _

Second, we consider a single gap of increasing length. We include 10, 100, 1000, 5000, and 10000 NaNs in the dataset (Figure 2). In this case, when the number of missing datapoints increases, we observe an overestimation of the Allan SD estimator, in particular to estimate the minimum value before the frequency drift impacts the dataset. The obtained values remain qualitatively accurate (r²>0.9) until 50% of the datapoints are missing, when the accuracy fo the estimator is strongly decreased. 


<img src="https://github.com/MathieuIso/Glaciotools/assets/168548936/44c22c0d-c003-46e6-9c1c-e3f66c2964de" width="474" height="489">

_Figure 2: Datasets and Allan SD estimation for increasing number of contiguous missing datapoints (10, 100, 1000, 5000, and 10000 points, in orange, yellow, purple, green, and blue, respectetively). _

Third, we consider an increasing number of medium gaps, by including several 200 contiguous NaN batches into the time serie, from a single batch, to 50 batches (Figure 3). Similarly to the previous case, we observe an overestimation of the Allan SD estimator with increasing number of missing datapoints, with quantitative agreement (r² > 0.9) until 50% of the datapoints are missing. 

<img src="https://github.com/MathieuIso/Glaciotools/assets/168548936/9576de07-4c5e-44af-a2a2-9d2f8cf901e9" width="474" height="489">

_Figure 3: Datasets and Allan SD estimation for increasing number of batches of 200 contiguous missing datapoints (1, 5, 10, 20, and 50 batches, in orange, yellow, purple, green, and blue, respectetively). _

