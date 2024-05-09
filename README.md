# Referenceless Transmission Matrix Calculation

A transmission matrix T is used to describe propagation through a multimode fibre or through a scattering medium, and describe the relationship between the complex input fields Ein and the complex output fields Eout.

Eout = T Ein

In most cases, an interferometer is used to measure the complex output fields to allow the transmission matrix to be experimentally characterised. Alternatively, a number of approaches have been proposed to characterise a transmission matrix from output intensity measurements. An excess of measurements is then acquired, and a clever algorithm is used to infer the transmission matrix. For example, convex optimisation, Bayesian approaches and phase retrieval techniques have all been used.

Here, we implement a modified Gerchberg-Saxton algorithm to obtain the transmission matrix from a series of non-interferometric measurements. This is a didactic demo that uses dummy data. I think the principle is the same as that described in Huang et al., "Generalizing the Gerchberg-Saxton algorithm for retrieving complex optical transmission matrices", Photonics Research, 9(10) (2021).

Keep in mind, these referenceless approaches do not actually yield a correct transmission matrix. Instead, an estimated transmission matrix is obtained that allows the magnitude of the output fields to be correctly predicted, but not the phase. Specifically, the relative phase between output pixels cannot be characterised without an interferometer, and so the rows of the estimated transmission matrix have unknown phase offsets between them.
