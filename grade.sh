CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

set -e
rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission
if [[ -e ListExamples.java ]]
then
    echo "File Found"
else
    echo "Missing Files"
    exit 1
fi
cd ..
cp TestListExamples.java student-submission
cp -r lib student-submission
cd student-submission

if ! javac -cp $CPATH *.java; then
    echo "Syntax Error"
    echo "F"
    exit 1
fi

set +e
java -cp $CPATH TestListExamples 2>error-put.txt

if [[ $? -ne 1 ]] 
then
    echo "F"
else
    echo "A" 
fi 