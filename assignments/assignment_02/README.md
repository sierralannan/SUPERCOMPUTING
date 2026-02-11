
# Assignment 2, Sierra Lannan, February 11th 2026

## My reflection (4–5 sentences) on what worked, what was hard, and what you'd change
#### I think the first thing I would change (after getting feedback on assignment 1) is to start using relative file paths, rather than "moving around" with cd. I got this feedback back after already completing assignment 2 and am realizing now when reviewing this assignment this is definetely a habit I need to break, as I do it in this assignment as well. This is something I will focus on in assignment 3. I think I also have a bad habit of not logging things in my README.md as I go, so I need to do this more frequently between steps to help my future self. I think breaking up this assignment into multiple work sessions is also harder because sometime I forget what I already did, but this is why my documentation is important.

## Task 1
### Logging into the HPC
(base) sierralannan@Sierras-MacBook-Air ~ % bora

### Navigating to make sure I have my workplace set up
selannan@bora.sciclone.wm.edu\ ~:$ cd SUPERCOMPUTING

selannan@bora.sciclone.wm.edu\ SUPERCOMPUTING:$ cd assignments

selannan@bora.sciclone.wm.edu\ assignments:$ cd assignment_02

selannan@bora.sciclone.wm.edu\ assignment_02:$ cd ..

selannan@bora.sciclone.wm.edu\ assignments:$ ls

selannan@bora.sciclone.wm.edu\ assignments:$ cd assignment_02

### Discovered I do not have a data directory so I add one
selannan@bora.sciclone.wm.edu\ assignment_02:$ cd data

selannan@bora.sciclone.wm.edu\ assignment_02:$ mkdir data

selannan@bora.sciclone.wm.edu\ assignment_02:$ cd data

### For this assingment, I stuck to a relatively simple directory structure (just including a directory for data) because we mainly focused on practicing moving data around. 

### Exiting the HPC
selannan@bora.sciclone.wm.edu\ data:$ exit

## Task 2

### Using Homebrew to add FTP
(base) sierralannan@Sierras-MacBook-Air ~ % ftp ftp.ncbi.nlm.nih.gov

(base) sierralannan@Sierras-MacBook-Air ~ % brew install inetutils


### Trying FTP again to 
(base) sierralannan@Sierras-MacBook-Air ~ % ftp ftp.ncbi.nlm.nih.gov

### Navigating to where the assignment designated and checking to make sure I am in the correct place
ftp> cd genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/

ftp> pwd

### Fixing Mac System issue w/ passive
ftp> passive

### Getting the two files
ftp> get GCF_000005845.2_ASM584v2_genomic.fna.gz

ftp> get GCF_000005845.2_ASM584v2_genomic.gff.gz

### Exiting the HPC and going back to my laptop

ftp> bye

(base) sierralannan@Sierras-MacBook-Air ~ % pwd

## Task 3

### Used Filezilla to transfer data to HPC
#### I connected using  Host: bora.sciclone.wm.edu and my William & Mary username and password. I then navigated to ~/SUPERCOMPUTING/assignments/assignment_2/data/ and dragged the files from my local machine to the HPC. I was able to check file permissions in Filezilla and select which ones should be checked. I made sure both group and public permissions had read selected so everyone could see these files. 

## Task 4

### Verify File Integrity with md5sum on my local machine

(base) sierralannan@Sierras-MacBook-Air ~ % md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz

(base) sierralannan@Sierras-MacBook-Air ~ % md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz

### Adding these to my README.md
(base) sierralannan@Sierras-MacBook-Air ~ % cd SUPERCOMPUTING
(base) sierralannan@Sierras-MacBook-Air SUPERCOMPUTING % cd assignments
(base) sierralannan@Sierras-MacBook-Air assignments % cd assignment_02
(base) sierralannan@Sierras-MacBook-Air assignment_02 % nano README.md

### Moving the data I downloaded earlier to the data directory in assignment 2
(base) sierralannan@Sierras-MacBook-Air assignment_02 % cd ..                                     

(base) sierralannan@Sierras-MacBook-Air assignments % cd ..

(base) sierralannan@Sierras-MacBook-Air SUPERCOMPUTING % cd ..

(base) sierralannan@Sierras-MacBook-Air ~ % mv GCF_000005845.2_ASM584v2_genomic.fna.gz ~/SUPERCOMPUTING/assignments/assignment_02/data

(base) sierralannan@Sierras-MacBook-Air ~ % mv GCF_000005845.2_ASM584v2_genomic.gff.gz ~/SUPERCOMPUTING/assignments/assignment_02/data

### Checking to make sure it moved correctly
(base) sierralannan@Sierras-MacBook-Air ~ % cd SUPERCOMPUTING

(base) sierralannan@Sierras-MacBook-Air SUPERCOMPUTING % cd assignments  

(base) sierralannan@Sierras-MacBook-Air assignments % cd assignment_02

(base) sierralannan@Sierras-MacBook-Air assignment_02 % cd data

(base) sierralannan@Sierras-MacBook-Air data % ls

### Verify File Integrity with md5sum on the HPC
(base) sierralannan@Sierras-MacBook-Air assignment_02 % bora

selannan@bora.sciclone.wm.edu\ ~:$ cd SUPERCOMPUTING

selannan@bora.sciclone.wm.edu\ SUPERCOMPUTING:$ cd assignments

selannan@bora.sciclone.wm.edu\ assignments:$ cd assignment_02

selannan@bora.sciclone.wm.edu\ assignment_02:$ cd data

selannan@bora.sciclone.wm.edu\ data:$ ls

selannan@bora.sciclone.wm.edu\ data:$ md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz

selannan@bora.sciclone.wm.edu\ data:$ md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz

### The local and HPC matched when using md5sum
1b894042b53655594a1623a7e0bb63f  GCF_000005845.2_ASM584v2_genomic.fna.gz

494dc5999874e584134da5818ffac925  GCF_000005845.2_ASM584v2_genomic.gff.gz

### Adding this information to the README.md on the HPC
selannan@bora.sciclone.wm.edu\ data:$ cd ..

selannan@bora.sciclone.wm.edu\ assignment_02:$ nano README.md

## Task 5
selannan@bora.sciclone.wm.edu\ assignment_02:$ cd ..

selannan@bora.sciclone.wm.edu\ assignments:$ cd ..

selannan@bora.sciclone.wm.edu\ SUPERCOMPUTING:$ cd ..

### Trying to edit the .bashrc to add useful bash aliases 
selannan@bora.sciclone.wm.edu\ ~:$ nano .bashrc

### Ran into some issues when running this so I am going to get help after class
source ~/.bashrc

### What do these aliases do?

#### This alias is going to go up one directory and clear the terminal screen, then printing the working directory and listing all files (even hidden) in long format, human readable file sizes, and puts directories first. I had to look up what the F did and found out it makes it more readable by indicating directories and other things with symbols
alias u='cd ..;clear;pwd;ls -alFh --group-directories-first'

#### This alias is going to do the same as above but go to the previous directory you were in
alias d='cd -;clear;pwd;ls -alFh --group-directories-first'

#### This is similar to the above aliases, as it just does the last step in the others of giving a detailed list with directories first
alias ll='ls -alFh --group-directories-first'


