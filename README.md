# simplex-docker
Dockerizes the apason/simplex program

This docker image contains the simplex application from https://github.com/apason/simplex

Start the container with a file argument of form: (that file must also be bind mounted to /app/simplex/)

m n

axi bxj ... cxk = <min/max>

axi bxj ... cxk = C

axi bxj ... cxk = C

...

where

i,j,k in Z+

a, b, c in R

C in R

n is a number of variables

m is a number of constraints

i.e. all variables are implicitly non-negative coefficients of one MUST be defined. Variable indices are integers (starting from one!)

For example. A file with the following content describes a linear program to maximize 4x1 + 3x2 with respect of the 4 constraints in the file.

-- start of example input file --

4 6

4x1 +3x2 = max

2x1 +3x2 +1x3 = 6

-3x1 +2x2 +1x4 = 3

+2x2 +1x5 = 5

2x1 +1x2 +1x6 = 4

-- end of example input file --

The simplex program in this docker image prints every pivot operation and the intermediate simplex tables during the calculation in addition to the final optimized values for the problem.

Example: docker run -v $(pwd)/example.txt:/app/simplex/file simplex file, where the local file example.txt is the example file in this readme.

There are few example files in the repository so those files can be given as an input without bind mounting.

Example: docker run simplex example.txt