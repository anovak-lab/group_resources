This page lists some classes our group has taken - some very useful and relevant to the group, but we include our reviews of additional classes as well to help future students.

## General Notes

Students must be enrolled for at least 12 hours per semester, even after you have finished all of your technical course requirements. Typically students take 2 technical classes per semester, the NPRE 596 seminar class, and then "make up the difference"
to get to 12 credits by enrolling in NPRE 599 Thesis Research. To enroll
in NPRE 599, you will need to specifically enroll in April Novak's section.

- In the course registration portal, enter CRN 24174 (for Professor Novak). This will initially add 0 hours.
- Under the "Schedule and Options" tab, you can then edit to go from 0 hours to however many are needed so that your entire schedule is at 12. See the screenshot of the interface below.

<p align="center">
  <img src="../photos/crn.png" width="700">
</p>


## NPRE

### Reactor Theory I (NPRE 555)

This course provides an introduction to neutron transport theory, covering both analytical and numerical approaches for deterministic and stochastic methods. Topics include the derivation of the transport equation, the PN method, the SN method, integral methods, and the Monte Carlo method. The course has a moderate workload, divided between homework assignments and programming projects. Homework involves solving multiple analytical problems. There are three programming projects focused on implementing the PN, SN, and Monte Carlo methods. This course serves as an excellent introduction for students interested in neutron transport, particularly from a computational perspective.

### Reactor Kinetics and Dynamics (NPRE 560)

This class presents historical approaches to fission reactor kinetics and dynamics, where the lectures and homeworks follow Introductory Nuclear Reactor Dynamics (Ott and Neuhold) and Dynamics of Nuclear Reactors (Hetrick) to the letter. Most of the methods discussed in the course have been antiquated by advances in computing over the last 30-40 years, however the intuition provided by these discussions may prove valuable to someone who is unfamiliar with the time behavior of fission reactors. The computer projects are the most useful components of the class to all students as they can be taylored to one's individual research interests. They consist of implementing various methods for point reactor kinetics (CP1), point reactor dynamics with feedback (CP2), and a kinetics/dynamics project of the student's choice (CP3).

### Probabilistic Risk Assessment (NPRE 461)

Theories and techniques of risk, safety, and reliability of complex systems and Probabilistic Risk Assessment (PRA), which provides input for risk-informed decision-making for design, operation, and regulatory oversight. Topics include: Systematic Risk Scenario Modeling, Consequence Analysis, Bayesian Updating, Bayesian Belief Network, Binary Decision Diagram, Uncertainty Propagation, Hardware Reliability, Human Error Modeling, Failure Causal Modeling, Maintenance and Repair Modeling, Risk Importance Ranking, and Data Analytics. The course material sacrifices depth for breadth, the software discussed is outdated, and the amount (not the difficulty) of the assignments is excessive. This is very much a busywork class. NPRE 461 one of the rare classes with an online section, which is valuable for some learners, but this should not be the first choice for in-person students in the M&M lab.

## CS

### Numerical Methods for Partial Differential Equations  (CS 555 / CSE 510 / MATH 552)

This class introduces varies numerical methods for solving both hyperbolic and elliptic Partial Differential Equations (PDEs). The first month is spent on finite difference methods to introduce the class to various numerical principles (stability, consistency, convergence, dispersion, dissipation, etc.), which is followed by a few weeks on finite volume methods (for hyperbolic problems), and a few weeks on finite element methods (for elliptic problems). The remainder of the course functions as a special topics class in numerical methods and depends on the interests of the students / whims of the professor. The course strikes a nice balance in introducing the theoretical underpinnings of numerical methods for PDEs while also providing opportunities to implement the methods on the four homeworks / on the final project. The class assumes a background which includes senior undergraduate numerics classes, and so some of the lectures may be difficult to follow if the student doesn't have said background. Overall, the course is worth taking if you want to gain a better understanding of the theoretical underpinnings of PDE numerics without taking a pure math class.


## TAM

### TAM 570: Spectral Methods for CFD

Spectral methods are one of the most efficient approaches to simulation of turbulent flows. In this course we learnt how and why these methods work. We wrote our own 3D spectral and multidomain spectral flow solvers in matlab. We covered the numerical analysis, iterative solvers, high-order semi-implicit timesteppers, fast matrix-free operator evaluation and inversion. We explored model problems from numerical analysis of PDEs to stability, transition, and turbulence in incompressible flows. The course had about 10 assignments and two projects. The two projects can be done using Nek5000/NekRS.

## ECE

### Applied Parallel programming (ECE 408/CS 483/CSE 408)

The aim of this course is to provide knowledge and hands-on experience in developing software for GPUs. The course workload is highly demanding. It includes two exams that together make up 50% of the grade, and they are quite difficult. There are eight programming lab assignments of steadily increasing complexity. All assignments involve programming a GPU system using CUDA. Tasks include matrix multiplication, convolution, reduction, histogram calculation, and sparse matrix-vector multiplication. Each assignment is divided into a coding part and a quiz part. The assignments account for 25% of the final grade and are of moderate difficulty. During the second half of the semester, students work on a larger, more complex AI project. The course does not cover MPI or OpenMP, so it is only useful for students interested specifically in GPU programming and AI.


## ME

### ME471: Finite Element Analysis

The course introduces and covers finite element method, it is offered every semester. The class focused on the following engineering problems: truss and frame structures, heat conduction, and linear elasticity. There are homeworks, coding projects, software projects (ABAQUS), midterm and final exams. In my opinion, it is an easy class and a good class to introduce finite element method.
The covered topics are:
1. Introduction and review matrix methods
2. Fundamentals of finite elements
3. Application to solid mechanics: truss elements, beam elements, plate and shell elements, constant strain triangle, vibration problems
4. Programming commercial packages (e.g., ABAQUS)
5. Application to heat transfer: one-dimensional, two-dimensional, transient problems, thermal stress
6. Advanced topics: numerical integration methods, isoparametric elements, fluid mechanics and nonlinear problems

### ME412: Numerical Thermo-Fluid Mechs

We covered the following topics:
1. Introduction of numerical solutions
2. error, stability, and convergence
3. One-dimensional steady heat conduction
4. One-dimensional unsteady heat conduction
5. Steady 2D heat conduction; iterative and direct methods
6. 2D unsteady heat conduction
7. Heat conduction in complex geometries
8. Fully-developed flow in complex ducts
9. 1D and 2D linear convection equation
10. Nonlinear convection equation
11. Derivation of Navier-Stokes equations
12. 2D unsteady fluid flows
13. 2D steady flows
14. 3D Duct flows

The course had an assignment every week, four coding projects, four fluent projects, and one final project that is mostly literature review.


## ATMS

### Numerical Fluid Dynamics (ATMS 502 / CSE 566)

This class focuses on solving fluid flow problems numerically while developing skills in programming and data visualization. No prior background in atmospheric sciences is required. Topics of stability, error types, and their quantification are studied. Students will learn and apply finite difference and finite volume methods by implementing them in code for various homework assignments. The course takes a gradual approach, beginning with a simple 1D advection problem and progressively advancing to 2D and 3D cases, including the use of both regular and nested grids, with students writing the code for grid nesting as well. A key goal of the course is to help students design their code for efficient execution on parallel computers. Prof. Jewett is a great teacher and runs the class very well. The amount of time you will spend on assignments will vary based on how proficient you are with programming. However, the professor is willing to help and debug your code with you, which is super helpful. You may want to check the computer programs you'll be solving in this class on http://rfd.atmos.uiuc.edu/502/

## MATH

### Methods of Applied Mathematics (MATH 558)
MATH 558 is a rigorous yet rewarding course for students who enjoy mathematical depth and its engineering applications. It builds a strong foundation in theory and modeling tools but demands comfort with advanced math and extensive proof writing. The course includes eight challenging and lengthy assignments, a take-home midterm, and a final project where students present on a chosen topic. Despite its intensity, the instructor’s support made the experience enjoyable. 

This course offers a comprehensive introduction to mathematical modeling techniques and asymptotic analysis. It begins with the nondimensionalization of ODE models and transitioning from discrete random walks to continuous reaction-advection-diffusion equations. Topics include Markov processes, stochastic differential equations, and the Kramers-Moyal expansion, leading to the derivation of the Liouville and Fokker-Planck equations from the master equation. A significant portion of the course is devoted to perturbation methods, beginning with regular perturbation and progressing to singular perturbation problems. Key concepts include asymptotic expansions, the method of dominant balance, error bounds using Grönwall’s inequality, and perturbation analysis of eigenvalue problems and second-order ODEs.

The course also introduces boundary layer theory, including problems with boundary layers at one or both endpoints. Attention is given to topics such as equilibrium analysis, nonlinear ODE systems and stability analysis. Further techniques include the method of multiple scales for handling systems with different timescales, and the asymptotic evaluation of integrals using tools like Laplace’s method, Watson’s lemma, and the method of stationary phase. Later modules focus on the WKB method for Schrödinger-type ODEs and boundary-layer problems, as well as methods of averaging and homogenization for multiscale systems. The course concludes with an introduction to Turing instability and spatial pattern formation in reaction-diffusion systems, including long-time behavior and stability analysis.
