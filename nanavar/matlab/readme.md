This toolbox contains a modified version of the Allan Standard Deviation calculation that can take into account missing values (included as NaN). In the current version, regular sampling of the input time series is still needed.

Here, we evaluate the impact of missing datapoints on the Allan SD estimator. To do so, we use a synthetic variable y combining a white noise, a red noise, and a trend. We add different amounts and structure of missing datapoints as NaN on this variable y and create sets of ynan. We compute the Allan SD on y and ynan in these case studies.

First, we consider single missing datapoints regularly spread in the dataset. We include one NaN every 10, 8, 6, 4, and 2 datapoints (practically, in the latter case it is recommended to resample your dataset at half the resolution rather than computing the Allan SD with the original dataset). With regular missing datapoints, the Allan SD estimator suffers systematic underestimation of the Allan SD from the original dataset. The obtained values remain qualitatively accurate (r²>0.9) until 50% of the datapoints are missing, when the accuracy of the estimator is strongly decreased.

Regular gaps.pdf _Figure 1: Datasets and Allan SD estimation for increasing number of regularly spaced single missing datapoints (every 10, 8, 6, 4, 2 points, in orange, yellow, purple, green, and blue, respectetively). _
