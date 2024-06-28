echo "$1"
cd "$1"

var=$(pwd)
basename $(pwd)
PROJECT_NAME="$(basename $PWD)"
echo "$PROJECT_NAME"
# RESET
rm -r ../project-data/$PROJECT_NAME
java -cp $PSWCP org.pseudosweep.Launch restore -p src/main/java/ -sdl

# CLASSPATH FOR PSEUDOSWEEP
mvn dependency:build-classpath -Dmdep.outputFile=cp.txt
export CLASSPATH=$CLASSPATH:$(<cp.txt)
echo $CLASSPATH
rm -r target/

# PSEUDOSWEEP - SDL
echo "RUNNING PSEUDOSWEEP SDL"
rm -r ps-data/
java -cp $PSWCP org.pseudosweep.Launch restore -p src/main/java/ -sdl
java -cp $PSWCP org.pseudosweep.Launch instrument -f src/main/java/org/apache/commons/codec/language/Caverphone2.java -sdl

mvn clean -l log_sdl-compile.log -Dcheckstyle.skip -Drat.skip=true package 
if grep "BUILD FAILURE" log_sdl-compile.log; then
    exit 1
fi
java -cp target/classes/:target/test-classes/:$PSWCP:$CLASSPATH org.pseudosweep.Launch sweep -p target/test-classes/ -sdl 
if grep "FATAL" ps-data/sweep.log; then
    exit 1
fi
java -cp $PSWCP org.pseudosweep.Launch analyze -sdl 

# PSEUDOSWEEP - XMT
echo "RUNNING PSEUDOSWEEP XMT"
rm -r target/
java -cp $PSWCP org.pseudosweep.Launch restore -p src/main/java/ -xmt 
java -cp $PSWCP  org.pseudosweep.Launch instrument -f src/main/java/org/apache/commons/codec/language/Caverphone2.java -xmt 

mvn clean -l xmt-compile.log -Dcheckstyle.skip -Drat.skip=true -Djacoco.skip=true package 
if grep "BUILD FAILURE" xmt-compile.log; then
    exit 1
fi
java -cp target/classes/:target/test-classes/:$PSWCP:$CLASSPATH org.pseudosweep.Launch sweep -p target/test-classes/ -xmt 
if grep "FATAL" ps-data/sweep.log; then
    exit 1
fi
java -cp $PSWCP org.pseudosweep.Launch analyze -xmt
java -cp $PSWCP org.pseudosweep.Launch restore -p src/main/java/ -xmt 
zip -r ps-data.zip ps-data/
mkdir -p ../project-data/$PROJECT_NAME && mv ps-data.zip ../project-data/$PROJECT_NAME/

cd ..
