# A genetic algorithm adapted for the Travelling Salesman Problem
Authors : Esmé James & Wilfried Pouchous

## Description

>The travelling salesman problem (TSP) asks the following question: "Given a list of cities and the distances between each pair of cities, >what is the shortest possible route that visits each city and returns to the origin city?" 

A mono-objective genetic algorithm adapted for the Travelling Salesman Problem containing user inputs for:
* Genetic Algorithm parameters (Population size, crossover and mutation probabilities, etc)
* A choice between multiple crossover options (partial crossover, crossover based on position, crossover based on cycle)
* A choice between multiple mutation options (exchange mutation, insertion mutation, inversion mutation, shifting mutation)

The best known path is printed onto a graph at each iteration.

## File organisation

The Genetic Algorithm is contained in the "AlgoGenetique" folder, containing each step of the algorithm in sub-folders (initialisation, evaluation, selection, ...).
The program is launched by executing the main.m file.
A folder called "Problemes" contains the functions to test the algorithm.
