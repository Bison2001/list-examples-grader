CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission

if [[ -f student-submission/ListExamples.java ]]
then
echo "Found the student submission file."
# grep --color Found the student submission file.
cd student-submission
cp ../TestListExamples.java ./

else
echo "Did not found the student submission file"
exit 1
fi


javac -cp $CPATH *.java
if [[ $? -eq 0 ]]
then 
echo "compile the files successfully"
# grep --color compile the files successfully

else
echo "can not compile the files"

fi
 

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > grade.txt
grep --color "FAILURES!!!" grade.txt

echo 'Finished cloning'
cd ..
java GradeServer 9999 > web.txt
