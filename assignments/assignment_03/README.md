# Assignment 3, Sierra Lannan, February 17th 2026

## Task 1
### Navigating to my assignment 3 directory and setting it up
bora

cd ./SUPERCOMPUTING/assignments/assignment_03

### Already have a README.md so I just added a place to store my data for this assignment since we are mainly working with summarizing data
mkdir data

## Task 2
### Grabbing the data
cd data

wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz

gunzip GCF_000001735.4_TAIR10.1_genomic.fna.gz

ls

## Task 3
### Question 1
grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | wc -l

### Question 2
grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | tr -d '\n' |  wc -c   

### Question 3
wc -l GCF_000001735.4_TAIR10.1_genomic.fna

### Question 4
grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | grep "mitochondrion" | wc -l

### Question 5
grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | grep "chromosome" | wc -l

### Question 6
grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | head -n 1 | wc -c

grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | head -n 2 | tail -n 1 |  wc -c

 grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | head -n 3 | tail -n 1 |  wc -c

### Question 7
grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | head -n 5 | tail -n 1 | wc -c

### Question 8
grep "AAAAAAAAAAAAAAAA" GCF_000001735.4_TAIR10.1_genomic.fna | wc -l

### Question 9
grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | sort | head -n 1 

### Question 10
paste <(grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna) <(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna) > genomic_data_tab.tsv

nano genomic_data_tab.tsv

## Task 5 
I think this assignment was really nice because it gave me hands-on experience tackling problems that require me to analyze data, in this case a DNA sequence file. I was able to look through the notes I took in class, as well as the lesson 3 google drive, to figure out the problems. I used grep for a lot of the problems and it really made me realize how incredibly useful grep can be when trying to analyze data. I think the hardest thing I struggled with was trying to rush, which led to minor typos, such as typing ">^" instead of "^>". I also ran into a problem in class when trying to copy and paste something I wrote in my Google Doc to the terminal (quotation marks were different). All of these experiences have helped me slow down and make sure I fully understand my code, as well as what all the commands do. I think in the past for a lot of my data science classes it was easy to get used to just copying and pasting the code provided from the professor without thinking too deeply about it. This was especially true with Applied Machine Learning where we were looking at many long lines of code every class. This class has helped me slow down and take it back to the basics which was much needed so I can refresh myself on terminal basics which I haven’t covered since my introductory computer science class. I think all of these commands and knowledge of them is super important in computational work (especially pipelines) because they enable us to analyze large datasets quickly. This is especially relevant when working with biological data, something I am less familiar with. I think this will really help me in my future career endeavours, as I am currently an intern for a local government's fire department so we are dealing with extremely large datasets (fire call data). I cannot wait to learn more about scripting so we can automate big processes in the future.
