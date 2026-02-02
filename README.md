# SUPERCOMPUTING

### Starting off at home
cd ~
### Checking my working directory
pwd
### Changing directory to SUPERCOMPUTING
cd SUPERCOMPUTING 
### Creating a directory for assignments
mkdir assignments
### Changing to said directory
cd assignments
### Creating a directory for assignnments 1 through 8
mkdir assignment_0{1..8}
### Double checking to make sure everything is in correct place
tree
### Changing directory to the proper assignment folder and creating a readme file for all 8 assignments
cd assignment_01
touch README.md
cd ..
cd assignment_02
touch README.md
cd ..
cd assignment_03
touch README.md
cd ..
cd assignment_04
touch README.md
cd ..
cd assignment_05
touch README.md
cd ..
cd assignment_06
touch README.md
cd ..
cd assignment_07
touch README.md
cd ..
cd assignment_08
touch README.md
cd ..
### Checking to make sure everything went as I wanted
tree
cd ..
### Pushing the changes to Github
git status
git add .           
git status
git commit -m "added assignment files"
git push 
### This is where I started to do the part of the assignment not completed in class by adding a proper folder structure to assignment 1
cd assignments
cd assignment_01
### Making a directory for data
mkdir data
cd data
### Adding a directory for raw and clean data
mkdir raw
mkdir clean
cd ..
### Checking what I have done so far
ls -alh
### Below I make directories for all the recommended parts of a proper folder structure
mkdir scripts
mkdir results
mkdir docs
mkdir config
mkdir logs
### Adding my assignment 1 essay
touch assignment_1_essay.md
### Checking what I have done
ls -alh
### Adding placeholder txt to clean and raw data
cd data
cd clean
touch example1.txt
cd ..
cd raw            
touch example2.txt
cd ..
### Adding placeholders to all the different directories
cd ..
cd scripts
touch script.sh
cd ..
cd results
touch example.csv
cd ..
cd docs
touch example.pdf
cd ..
cd config
touch example.cnf
cd ..
cd logs
touch logfile.log
cd ..
cd ..
cd ..
### Checking my work so far
tree
### Pushing the changes to github
git status
git add .
git commit -m "assignment 1 task 1"
git push
