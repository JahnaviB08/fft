# fft
Introduction

In this SystemVerilog project, parameterized Fast Fourier Transform (FFT) using 16-bit integer arithmetic operations is implemented. FFT is a widely used algorithm in signal processing for transforming time-domain signals into frequency-domain representations. This project provides an efficient, parameterized FFT implementation suitable for various arithmetic operations.

Features

1. Utilizes 16-bit integer arithmetic for resource-efficient FPGA implementations.
2. Scalable design for various FPGA platforms.

Prerequisites

To run the code, you will require a SystemVerilog-compatible environment (e.g., Xilinx Vivado, EDA playground). There are three files containing the code and a test bench. The top file (FFT.sv) instantiates two modules (butterfly.sv) and (computeMatrix.sv). Make sure you compile all the files. 

About the codes and test-bench

1. butterfly.sv

     The Butterfly Method is a fundamental concept in the Fast Fourier Transform (FFT) algorithm, which is used to efficiently compute the Discrete Fourier Transform (DFT) of a sequence of complex numbers. The principle of divide and conquer is used for the DFT computation of smaller sequences, making FFT significantly faster than DFT calculation, especially for large data sets. The FFT algorithm is recursive, dividing the data into smaller sub-sequences and applying the butterfly operations until it reaches the base case, usually when the sub-sequence length becomes 2 or 1.
   
   In the context of the FFT algorithm, a "butterfly" is a computational unit that combines two complex values (referred to as "twiddle factors") into two new complex values using some arithmetic operations. Twiddle factors are responsible for the frequency-domain transformations in the FFT. The term "butterfly" comes from the way these computational units are often depicted visually, resembling the wings of a butterfly.
   
   The final result of the FFT is obtained when all the recursive stages are complete, and the complex numbers have been recombined and processed through the butterfly operations. The key insight of the Butterfly Method is that it reduces the number of computations required to compute the DFT by a significant factor compared to the naive approach, where every pair of input values is multiplied by all the complex sinusoids corresponding to the frequencies of the DFT. FFT achieves a time complexity of O(NlogN) whereas traditional DFT computation takes O(N^2). The complexity of calculation decreases significantly for large data sets.

2. computeMatrix.sv

     This module computes the DFT of input array 'x' and produces and output array 'X'. It calculates a constant 'theta', representing the phase increment used in the DFT computation, based on the formula theta = -2*pi/N. The DFT computation involves complex multiplication with trigonometric functions represented as $cos and $sin. It accumulates the real and imaginary parts of the DFT output in X[k][0] and X[k][1] respectively corresponding frequency bin 'k'.

3. FFT.sv

     This module performs FFT on an input signal 'x' and generates the result in 'X', where 'N' represents the FFT size and 'W' indicates the width for input and output data. The input signal x is divided into even (xe) and odd (xo) components, preparing them for further processing. The input is recursively split and processed using butterfly stages and two sub-FFTs (FFT_e and FFT_o) or directly the FFT is computed using computeMatrix module. The butterfly stages perform complex multiplications and additions required for the FFT computation.

Test bench

This code sets up an FFT simulation with a sample input signal, computes the FFT, and prints the real and imaginary components of the input and output signals for verification. The input signal x consists of a simple sequence of 16 complex numbers. 
