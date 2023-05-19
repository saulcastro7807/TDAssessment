echo "This script will execute the tasks in assignment 3"
echo ""
echo "Task 1 will create:"
echo "    * Docker image based on Dockerfile"
echo ""
echo "Task 1: script will run the following command:"
echo "docker build . -t assessment:assignment3"
echo "Press ENTER to execute command"
read
echo "***** BEGIN Command execution output *****"
sudo docker build . -t assessment:assignment3
echo "***** END Command execution output *****"
echo ""
echo "Task 2 will execute"
echo "    * Run built docker image"
echo ""
echo "Task 2: script will run the following command:"
echo "docker run -p 5000:5000 assessment:assignment3"
echo "Press ENTER to execute command"
read
echo "***** BEGIN Command execution output *****"
sudo docker run -d -p 5000:5000 assessment:assignment3 > output.txt 2>&1 &
echo "***** END Command execution output *****"
echo ""
echo "Task 3 will execute test"
echo "    * Call all 3 API endpoints with GET and POST methods "
echo "Press ENTER to execute tests"
read
echo "curl -H "Content-Type: application/json" http://localhost:5000/"
curl -H "Content-Type: application/json" http://localhost:5000/
echo ""
echo "curl -H "Content-Type: application/json" http://localhost:5000/square?number=5"
curl -H "Content-Type: application/json" http://localhost:5000/square?number=5
echo ""
echo "curl -X POST -H "Content-Type: application/json" http://localhost:5000/square -d '{"number" : "5"}'"
curl -X POST -H "Content-Type: application/json" http://localhost:5000/square -d '{"number" : "5"}'
echo ""
echo "curl -H "Content-Type: application/json" http://localhost:5000/cube?number=3"
curl -H "Content-Type: application/json" http://localhost:5000/cube?number=3
echo ""
echo "curl -X POST -H "Content-Type: application/json" http://localhost:5000/cube -d '{"number" : "3"}'"
curl -X POST -H "Content-Type: application/json" http://localhost:5000/cube -d '{"number" : "3"}'
echo ""
echo "curl -H "Content-Type: application/json" http://localhost:5000/squareroot?number=9"
curl -H "Content-Type: application/json" http://localhost:5000/squareroot?number=9
echo ""
echo "curl -X POST -H "Content-Type: application/json" http://localhost:5000/squareroot -d '{"number" : "9"}'"
curl -X POST -H "Content-Type: application/json" http://localhost:5000/squareroot -d '{"number" : "9"}'
echo ""
