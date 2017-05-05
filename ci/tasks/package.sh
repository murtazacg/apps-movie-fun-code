#!/bin/bash
echo "1Done packaging"
set -e +x
echo "2Done packaging"
pushd movie-fun
  echo "Packaging JAR"
  ./mvnw clean package -DskipTests
popd
echo "3Done packaging"
jar_count=`find movie-fun/target -type f -name *.war | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one war found, don't know which one to deploy. Exiting"
  exit 1
fi

find movie-fun/target -type f -name *.war -exec cp "{}" package-output/movie-fun.war \;

echo "Done packaging"
exit 0